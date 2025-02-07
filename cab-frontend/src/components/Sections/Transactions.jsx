import React from "react";
import "../table.css";

import { Button, Container, Table, Col, Row } from "react-bootstrap";

const Transactions = () => {
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
                        <th>MRIS/DR</th>
                        <th>Supplier</th>
                        <th>Requested By</th>
                        <th>Section</th>
                        <th>Purpose</th>
                        <th>Item ID</th>
                        <th>Product Name</th>
                        <th>Area</th>
                        <th>Purchased From Supplier</th>
                        <th>Return to Supplier</th>
                        <th>Transfer from Other Warehouse</th>
                        <th>Transfer to Other Warehouse</th>
                        <th>Issued Qty.</th>
                        <th>Returned Qty.</th>
                        <th>Consumption</th>
                        <th>Cost</th>
                        <th>Total</th>
                        <th>Action</th>
                    </thead>
                    <tbody>

                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <Button >
                        + Record New Transaction
                    </Button>
                </Col>
            </Row>
        </Container>
    );
};

export default Transactions;