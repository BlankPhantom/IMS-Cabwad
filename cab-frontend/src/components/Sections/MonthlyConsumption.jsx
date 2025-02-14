import React from "react";
import "../table.css";

import { Button, Container, Table, Col, Row } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const MonthlyConsumption = () => {
    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 style={{fontWeight: '650'}}>Monthly Consumption</h2>
                </Col>
            </Row>

            <Row>
                <Col>
                    < MonthYearPicker />
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
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