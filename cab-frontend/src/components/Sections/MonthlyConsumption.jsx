import React from "react";
import "../table.css";

import { Button, Container, Table, Col, Row } from "react-bootstrap";

const MonthlyConsumption = () => {
    return (
        <Container style={{ width: '90%' }} fluid className="d-flex flex-column justify-content-center mt-5">
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