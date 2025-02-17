import React, { useState, useEffect } from "react";
import { Button, Container, Col, Row, Card, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { API_ENDPOINTS } from "../../config";

const SummaryReport = () => {

    return (
        <Container style={{ width: '95%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 style={{ fontWeight: '650' }}>Summary Report</h2>
                </Col>
            </Row>

            <Row className="mt-3 d-flex align-items-center justify-content-between">
                <Col md={6}>
                    <MonthYearPicker />
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
