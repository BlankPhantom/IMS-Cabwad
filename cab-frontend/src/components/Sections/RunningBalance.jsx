import React from "react";
import "../table.css";

import { Button, Container, Table, Col, Row } from "react-bootstrap";

const RunningBalance = () => {
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
                        <th>Item ID</th>
                        <th>Product Name</th>
                        <th>Unit of Measurement</th>
                        <th>Beginning Balance</th>
                        <th>Purchased from Supplier</th>
                        <th>Return to Supplier</th>
                        <th>Transfer From Other Warehouse</th>
                        <th>Transfer to Other Warehouse</th>
                        <th>Issued Qty.</th> 
                        <th>Returned Qty.</th>
                        <th>Consumption</th>
                        <th>Available Stocks</th>
                        <th>Cost</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </thead>
                    <tbody>

                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default RunningBalance;