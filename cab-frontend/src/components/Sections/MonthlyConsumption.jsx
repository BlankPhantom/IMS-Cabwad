import React, { useState, useEffect } from "react";
import "../table.css";

import { Button, Container, Table, Col, Row, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { API_ENDPOINTS } from "../../config";

const MonthlyConsumption = () => {
    const [selectedSection, setSelectedSection] = useState("");
    const [sections, setSections] = useState([]);

    useEffect(() => {
        fetchSections();
    }, []);

    const fetchSections = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.SECTION_LIST);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            console.log("Fetched sections data:", data); // Debugging line
            setSections(data);
        } catch (error) {
            console.error("Error fetching sections:", error);
        }
    };

    const handleSectionChange = (event) => {
        setSelectedSection(event.target.value);
    };

    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 style={{fontWeight: '650'}}>Monthly Consumption</h2>
                </Col>
            </Row>


            <Row className="mt-3 d-flex align-items-center justify-content-between">
                <Col md={6}>
                    <MonthYearPicker />
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
                    <input type="search" className="" placeholder="Search" style={{ width: '300px' }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <th>Date</th>
                        <th>Week</th>
                        <th>Item ID</th>
                        <th>Product Name</th>
                        <th>Consumption</th>
                        <th>Cost</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </thead>
                    <tbody>
                        {/* DATA */}
                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default MonthlyConsumption;