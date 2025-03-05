import React, { useState, useEffect } from "react";
import { Container, Row, Col, Form } from "react-bootstrap";
import Plot from 'react-plotly.js';
import { API_ENDPOINTS } from "../../config";
import MonthYearPicker from "../MonthYearPicker";
import "../table.css";

const WeeklyConsumption = () => {
    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth() + 1);
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    const [monthlyConsumptionData, setMonthlyConsumptionData] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [selectedSection, setSelectedSection] = useState("");
    const [sections, setSections] = useState([]);

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
    };

    // Handle Section Change
    const handleSectionChange = (event) => {
        setSelectedSection(event.target.value);
    };

    // Effect to fetch data on component mount and when filters change
    useEffect(() => {
        fetchSections();
        fetchMonthlyConsumption();
    }, [selectedMonth, selectedYear, selectedSection]);

    // Prepare data for Plotly
    const prepareChartData = () => {
        if (!monthlyConsumptionData.length) return null;
    
        // Group and aggregate data by item name for Week 1
        const aggregatedData = monthlyConsumptionData.reduce((acc, item) => {
            const existingItem = acc.find(i => i.itemName === item.itemName);
    
            if (existingItem) {
                existingItem.week1 += item.week === 1 ? item.consumption : 0;
                existingItem.week2 += item.week === 2 ? item.consumption : 0;
                existingItem.week3 += item.week === 3 ? item.consumption : 0;
                existingItem.week4 += item.week === 4 ? item.consumption : 0;
            } else {
                acc.push({
                    itemName: item.itemName,
                    week1: item.week === 1 ? item.consumption : 0,
                    week2: item.week === 2 ? item.consumption : 0,
                    week3: item.week === 3 ? item.consumption : 0,
                    week4: item.week === 4 ? item.consumption : 0,
                });
            }
    
            return acc;
        }, []);
    
        const traces = aggregatedData.map(productData => ({
            x: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
            y: [-productData.week1, -productData.week2, -productData.week3, -productData.week3], // Show data only in Week 1
            type: 'bar',
            name: productData.itemName
        }));
    
        return traces;
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
                <Col md={6}>
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
                                title: 'Estimated Weekly Product Consumption',
                                barmode: 'group',
                                xaxis: { title: 'Weeks' },
                                yaxis: { title: 'Estimated Consumption Quantity' },
                                height: 500,
                                width: 1000, // Adjust width as needed
                            }}
                            config={{ responsive: true }}
                        />
                    </Col>
                ) : (
                    <Col className="text-center">No consumption data available</Col>
                )}
            </Row>
        </Container>
    );
};

export default WeeklyConsumption;