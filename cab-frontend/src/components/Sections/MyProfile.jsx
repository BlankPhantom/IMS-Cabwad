import React, { useState, useEffect } from "react";
import { Container, Col, Row, Card, Alert } from "react-bootstrap";
import BtnChangePass from "../Button/BtnChangePass";
import { API_ENDPOINTS } from "../../config";

const MyProfile = () => {
    const [userData, setUserData] = useState({
        first_name: "",
        last_name: "",
        email: "",
        username: "",
    });
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetchUserProfile();
    }, []);

    const fetchUserProfile = async () => {
        const token = localStorage.getItem("access_token");
        const userId = localStorage.getItem("id");

        if (!token || !userId) {
            setError("You must be logged in to view your profile");
            setLoading(false);
            return;
        }

        try {
            // Using the existing USER_LIST endpoint and filtering for the current user
            const response = await fetch(API_ENDPOINTS.USER_LIST, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
            });

            if (!response.ok) {
                throw new Error("Failed to fetch user profile");
            }

            const data = await response.json();
            
            // Find the current user in the list
            const currentUser = data.find(user => user.id.toString() === userId);
            
            if (currentUser) {
                setUserData(currentUser);
            } else {
                throw new Error("User not found");
            }
            
            setLoading(false);
        } catch (e) {
            console.error("Error fetching user profile:", e);
            setError("Failed to load profile information");
            setLoading(false);
        }
    };

    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <h2 className="mt-5" style={{ fontWeight: '650' }}>My Profile</h2>
            </Row>
            
            <Row className="d-flex justify-content-center mt-5">
                <Card style={{ width: '70%', backgroundColor: '#ffffff' }} className="border-0 shadow">
                    <Card.Body>
                        {error && <Alert variant="danger">{error}</Alert>}
                        {loading ? (
                            <div className="text-center">Loading profile information...</div>
                        ) : (
                            <Row>
                                <Col>
                                    <div className="mb-4">
                                        <p style={{fontSize: '14px'}} className="text-muted">First Name</p>
                                        <p>{userData.first_name}</p>
                                    </div>
                                    
                                    <div className="mb-4">
                                        <p style={{fontSize: '14px'}} className="text-muted">Last Name</p>
                                        <p>{userData.last_name}</p>
                                    </div>
                                    
                                    <div className="mb-4">
                                        <p style={{fontSize: '14px'}} className="text-muted">Email</p>
                                        <p>{userData.email}</p>
                                    </div>
                                </Col>

                                <Col>
                                    <div className="mb-4">
                                        <p style={{fontSize: '14px'}} className="text-muted">Username</p>
                                        <p>{userData.username}</p>
                                    </div>
                                    
                                    <div className="mb-4">
                                        <p style={{fontSize: '14px'}} className="text-muted">Password</p>
                                        <p>••••••••</p>
                                    </div>
                                    
                                    <BtnChangePass/>
                                </Col>
                            </Row>
                        )}
                    </Card.Body>
                </Card>
            </Row>
        </Container>
    );
};

export default MyProfile;