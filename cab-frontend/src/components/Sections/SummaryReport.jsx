import React, { useState, useEffect } from "react";
import { Button, Container, Col, Row, Card, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { API_ENDPOINTS } from "../../config";

const SummaryReport = () => {
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
        <Container style={{ width: '95%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 style={{ fontWeight: '650' }}>Summary Report</h2>
                </Col>
            </Row>

            {/* MonthYearPicker & Section Dropdown in one Row */}
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
                <Col className="d-flex justify-content-center mt-3">
                    <Button className="shadow">
                        GENERATE MONTHLY REPORT
                    </Button>
                </Col>
            </Row>

            <Row>
                <Card className="mt-3 shadow-lg genReport">
                    <Card.Body>
                        {/* GENERATED REPORT */}
                    </Card.Body>
                </Card>
            </Row>
        </Container>
    );
};

export default SummaryReport;
