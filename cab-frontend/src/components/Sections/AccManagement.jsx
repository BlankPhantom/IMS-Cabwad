import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row } from "react-bootstrap";
import BtnAddUser from "../Button/BtnAddUser";


const AccManagement = () => {
    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <h2 className="mt-5" style={{ fontWeight: '650' }}>Account Management</h2>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input
                        type="search"
                        className="form-control"
                        placeholder="Search"
                        style={{ width: '300px' }}
                    />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <BtnAddUser />
                </Col>
            </Row>
        </Container>
    );
};

export default AccManagement;