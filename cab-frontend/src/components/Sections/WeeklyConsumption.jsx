import React, { useState, useEffect } from "react";
import { Container, Row, Col, Form } from "react-bootstrap";
import Plot from 'react-plotly.js';
import { API_ENDPOINTS } from "../../config";
import MonthYearPicker from "../MonthYearPicker";
import "../table.css";

const WeeklyConsumption = () => {
    // Calculate current week of the month (1-4)
    const getCurrentWeekOfMonth = () => {
        const today = new Date();
        const dayOfMonth = today.getDate();
        
        // Simple calculation dividing the month into 4 weeks
        if (dayOfMonth <= 7) return 1;
        if (dayOfMonth <= 14) return 2;
        if (dayOfMonth <= 21) return 3;
        return 4;
    };

    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth() + 1);
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    const [monthlyConsumptionData, setMonthlyConsumptionData] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [selectedSection, setSelectedSection] = useState("");
    const [sections, setSections] = useState([]);
    const [selectedWeek, setSelectedWeek] = useState(getCurrentWeekOfMonth()); // Initialize with current week

    // Fetch sections
    const fetchSections = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.SECTION_LIST);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setSections(data);
        } catch (error) {
            console.error("Error fetching sections:", error);
        }
    };

    const fetchMonthlyConsumption = async () => {
        setLoading(true);
        setError(null);
        try {
            const queryParams = new URLSearchParams({
                month: selectedMonth,
                year: selectedYear,
                ...(selectedSection && { sectionID: selectedSection })
            });

            const response = await fetch(
                `${API_ENDPOINTS.MONTHLY_CONSUMPTION}?${queryParams}`
            );

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const data = await response.json();

            if (data.length === 0) {
                setError("No consumption data available for the selected period");
            }

            setMonthlyConsumptionData(data);
        } catch (error) {
            console.error("Error fetching monthly consumption:", error);
            setError(error.message || "Failed to load monthly consumption data");
        } finally {
            setLoading(false);
        }
    };

    // Handle Month-Year Change
    const handleMonthYearChange = (month, year) => {
        setSelectedMonth(month);
        setSelectedYear(year);
        
        // If user selects current month and year, set the week to current week
        const currentDate = new Date();
        if (month === currentDate.getMonth() + 1 && year === currentDate.getFullYear()) {
            setSelectedWeek(getCurrentWeekOfMonth());
        }
    };

    // Handle Section Change
    const handleSectionChange = (event) => {
        setSelectedSection(event.target.value);
    };

    // Handle Week Change
    const handleWeekChange = (event) => {
        setSelectedWeek(parseInt(event.target.value, 10));
    };

    // Effect to fetch data on component mount and when filters change
    useEffect(() => {
        fetchSections();
        fetchMonthlyConsumption();
    }, [selectedMonth, selectedYear, selectedSection]);

    // Prepare data for Plotly
    const prepareChartData = () => {
        if (!monthlyConsumptionData.length) return null;
    
        // Group and aggregate data by item name for the selected week
        const aggregatedData = monthlyConsumptionData.reduce((acc, item) => {
            if (item.week === selectedWeek) {
                const existingItem = acc.find(i => i.itemName === item.itemName);
                
                if (existingItem) {
                    existingItem.consumption += item.consumption;
                } else {
                    acc.push({
                        itemName: item.itemName,
                        consumption: item.consumption,
                    });
                }
            }
            return acc;
        }, []);
    
        // Sort by consumption amount (optional)
        aggregatedData.sort((a, b) => b.consumption - a.consumption);
    
        // Create individual traces for each product to have them in the legend
        return aggregatedData.map(item => ({
            x: [item.itemName],
            y: [-item.consumption], // Negative values for consumption
            type: 'bar',
            name: item.itemName
        }));
    };

    const chartData = prepareChartData();

    return (
        <Container style={{ width: "100%" }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 className="mt-5" style={{ fontWeight: "650" }}>Weekly Consumption Estimation</h2>
                </Col>
            </Row>

            <Row className="mt-3 d-flex align-items-center justify-content-between">
                <Col md={4}>
                    <MonthYearPicker onMonthYearChange={handleMonthYearChange} />
                </Col>
                <Col md={4}>
                    <Form.Group controlId="sectionSelect">
                        <Form.Select
                            name="section"
                            value={selectedSection}
                            onChange={handleSectionChange}
                        >
                            <option value="">All Sections</option>
                            {sections.map((section) => (
                                <option
                                    key={section.sectionID}
                                    value={section.sectionID}
                                >
                                    {section.sectionName}
                                </option>
                            ))}
                        </Form.Select>
                    </Form.Group>
                </Col>
                <Col md={3}>
                    <Form.Group controlId="weekSelect">
                        <Form.Select
                            name="week"
                            value={selectedWeek}
                            onChange={handleWeekChange}
                        >
                            <option value="1">Week 1</option>
                            <option value="2">Week 2</option>
                            <option value="3">Week 3</option>
                            <option value="4">Week 4</option>
                        </Form.Select>
                    </Form.Group>
                </Col>
            </Row>

            <Row className="mt-4 w-100 justify-content-center">
                {loading ? (
                    <Col className="text-center">Loading data...</Col>
                ) : error ? (
                    <Col className="text-center text-danger">{error}</Col>
                ) : chartData && chartData.length > 0 ? (
                    <Col className="d-flex justify-content-center">
                        <Plot
                            data={chartData}
                            layout={{
                                title: `Week ${selectedWeek} Estimated Product Consumption`,
                                barmode: 'group',
                                xaxis: { 
                                    title: 'Products',
                                    visible: false, 
                                    showticklabels: true
                                },
                                yaxis: { 
                                    title: 'Estimated Consumption Quantity',
                                    tickformat: ',d', // Format tick labels without negative sign
                                    tickprefix: '-'   // Add negative prefix to tick labels
                                },
                                height: 500,
                                width: 1000, // Adjust width as needed
                                showlegend: true,
                                legend: {
                                    orientation: 'v',
                                    xanchor: 'right',
                                    yanchor: 'top',
                                    x: 5,
                                    y: 1
                                }
                            }}
                            config={{ responsive: true }}
                        />
                    </Col>
                ) : (
                    <Col className="text-center">No consumption data available for Week {selectedWeek}</Col>
                )}
            </Row>
        </Container>
    );
};

export default WeeklyConsumption;