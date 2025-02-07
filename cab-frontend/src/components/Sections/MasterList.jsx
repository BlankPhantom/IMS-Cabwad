import React from "react";
import "../table.css";

import { Button, Container, Table, Col, Row } from "react-bootstrap";

const Masterlist = () => {
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
                        <th>Classification</th>
                        <th>Actions</th>
                    </thead>
                    <tbody>

                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <Button >
                        + Add New Item 
                    </Button>
                </Col>
            </Row>

        </Container>
    );
};

export default Masterlist;