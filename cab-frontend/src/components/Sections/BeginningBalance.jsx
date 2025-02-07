import React from "react";
import "../table.css";

import { Button, Container, Table, Col, Row } from "react-bootstrap";

const BeginningBalance = () => {
    return (
        <Container style={{ width: '80%' }} fluid className="d-flex flex-column justify-content-center mt-5">
            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input type="search" className="" placeholder="Search" style={{ width: '300px' }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <th>Item ID</th>
                        <th>Product Name</th>
                        <th>Unit of Measurement</th>
                        <th>Available Stocks</th>
                        <th>Average Unit Cost</th>
                        <th>Total Cost of Available Stocks</th>
                        <th>Actions</th>
                    </thead>
                    <tbody>

                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default BeginningBalance;