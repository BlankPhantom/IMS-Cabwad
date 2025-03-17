import React from "react";
import { Container, Col, Row, Card } from "react-bootstrap";
import BtnChangePass from "../Button/BtnChangePass";

const MyProfile = () => {
    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <h2 className="mt-5" style={{ fontWeight: '650' }}>My Profile</h2>
            </Row>
            
            <Row className="d-flex justify-content-center mt-5">
                <Card style={{ width: '70%', backgroundColor: '#ffffff' }} className="border-0 shadow">
                    <Card.Body>
                        <Row>
                            <Col>
                                <div className="mb-4">
                                    <p style={{fontSize: '14px'}} className="text-muted">First Name</p>
                                    <p></p>
                                </div>
                                
                                <div className="mb-4">
                                    <p style={{fontSize: '14px'}} className="text-muted">Last Name</p>
                                    <p></p>
                                </div>
                                
                                <div className="mb-4">
                                    <p style={{fontSize: '14px'}} className="text-muted">Email</p>
                                    <p></p>
                                </div>
                            </Col>

                            <Col>
                                <div className="mb-4">
                                    <p style={{fontSize: '14px'}} className="text-muted">Username</p>
                                    <p></p>
                                </div>
                                
                                <div className="mb-4">
                                    <p style={{fontSize: '14px'}} className="text-muted">Password</p>
                                    <p></p>
                                </div>
                                
                                <BtnChangePass/>
                            </Col>
                        </Row>
                    </Card.Body>
                </Card>
            </Row>
        </Container>
    );
};

export default MyProfile;