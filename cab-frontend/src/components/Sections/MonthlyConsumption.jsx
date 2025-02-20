import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { API_ENDPOINTS } from "../../config";

const MonthlyConsumption = () => {
    const [selectedSection, setSelectedSection] = useState("");
    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth() + 1); // JavaScript months are 0-based
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    const [sections, setSections] = useState([]);
    const [consumptionData, setConsumptionData] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetchSections();
        fetchMonthlyConsumption();
    }, []);

    useEffect(() => {
        fetchMonthlyConsumption();
    }, [selectedMonth, selectedYear, selectedSection]);

    // Fetch sections for the dropdown
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

    // Fetch Monthly Consumption Data
    const fetchMonthlyConsumption = async () => {
        setLoading(true);
        setError(null);
        try {
            const response = await fetch(`${API_ENDPOINTS.MONTHLY_CONSUMPTION}?month=${selectedMonth}&year=${selectedYear}&section=${selectedSection}`);
            if (!response.ok) {
                throw new Error("Failed to fetch monthly consumption data.");
            }
            const data = await response.json();
            setConsumptionData(data);
        } catch (error) {
            console.error("Error fetching monthly consumption:", error);
            setError("Failed to load monthly consumption data.");
        } finally {
            setLoading(false);
        }
    };

    // Handle Section Change
    const handleSectionChange = (event) => {
        setSelectedSection(event.target.value);
    };

    // Handle Month-Year Change
    const handleMonthYearChange = (month, year) => {
        setSelectedMonth(month);
        setSelectedYear(year);
    };

    return (
        <Container style={{ width: "100%" }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 style={{ fontWeight: "650" }}>Monthly Consumption</h2>
                </Col>
            </Row>

            <Row className="mt-3 d-flex align-items-center justify-content-between">
                <Col md={6}>
                    <MonthYearPicker onMonthYearChange={handleMonthYearChange} />
                </Col>
                <Col md={4}>
                    <Form.Group controlId="sectionSelect">
                        <Form.Select name="section" value={selectedSection} onChange={handleSectionChange}>
                            <option value="">Select Section</option>
                            {sections.map((section) => (
                                <option key={section.sectionID} value={section.sectionID}>
                                    {section.sectionName}
                                </option>
                            ))}
                        </Form.Select>
                    </Form.Group>
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-4">
                    <input type="search" className="" placeholder="Search" style={{ width: "300px" }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Week</th>
                            <th>Item ID</th>
                            <th>Product Name</th>
                            <th>Consumption</th>
                            <th>Cost</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan="7" className="text-center">Loading data...</td>
                            </tr>
                        ) : error ? (
                            <tr>
                                <td colSpan="7" className="text-center text-danger">{error}</td>
                            </tr>
                        ) : consumptionData.length > 0 ? (
                            consumptionData.map((item, index) => (
                                <tr key={index}>
                                    <td>{item.date}</td>
                                    <td>{item.week}</td>
                                    <td>{item.itemID}</td>
                                    <td>{item.productName}</td>
                                    <td>{item.consumption}</td>
                                    <td>₱{item.cost}</td>
                                    <td>₱{item.total}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="7" className="text-center">No records found.</td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default MonthlyConsumption;