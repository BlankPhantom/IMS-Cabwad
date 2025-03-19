import React, { useState, useEffect } from "react";
import { Button, Modal, Form, Row, Col, Alert, Spinner } from "react-bootstrap";
import { API_ENDPOINTS } from "../../config";
import { faEye, faEyeSlash, faCheckCircle, faTimesCircle } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const BtnChangePass = () => {
    const [show, setShow] = useState(false);
    const [oldPassword, setOldPassword] = useState("");
    const [newPassword, setNewPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [error, setError] = useState(null);
    const [success, setSuccess] = useState(null);
    const [isLoading, setIsLoading] = useState(false);
    const [showOldPassword, setShowOldPassword] = useState(false);
    const [showNewPassword, setShowNewPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);
    const [passwordStrength, setPasswordStrength] = useState(0);
    const [passwordFeedback, setPasswordFeedback] = useState([]);

    // Password validation criteria
    const passwordRequirements = [
        { regex: /.{6,}/, message: "At least 6 characters" },
        { regex: /[A-Z]/, message: "At least one uppercase letter" },
        { regex: /[a-z]/, message: "At least one lowercase letter" },
        { regex: /[0-9]/, message: "At least one number" },
    ];

    useEffect(() => {
        if (newPassword) {
            const metRequirements = passwordRequirements.filter(req => req.regex.test(newPassword));
            setPasswordStrength(Math.floor((metRequirements.length / passwordRequirements.length) * 100));
            setPasswordFeedback(passwordRequirements);
        } else {
            setPasswordStrength(0);
            setPasswordFeedback([]);
        }
    }, [newPassword]);

    const handleClose = () => {
        setShow(false);
        setOldPassword("");
        setNewPassword("");
        setConfirmPassword("");
        setError(null);
        setSuccess(null);
        setShowOldPassword(false);
        setShowNewPassword(false);
        setShowConfirmPassword(false);
    };
    
    const handleShow = () => setShow(true);

    const validatePassword = () => {
        // Check if passwords match
        if (newPassword !== confirmPassword) {
            setError("New password and confirm password do not match");
            return false;
        }

        // Check if password meets minimum requirements
        const meetsRequirements = passwordRequirements.every(req => req.regex.test(newPassword));
        if (!meetsRequirements) {
            setError("Password does not meet all requirements");
            return false;
        }

        // Check if new password is different from old password
        if (newPassword === oldPassword) {
            setError("New password must be different from old password");
            return false;
        }

        return true;
    };

    const handleChangePassword = async (e) => {
        e.preventDefault();
        setError(null);
        setSuccess(null);
        
        if (!validatePassword()) {
            return;
        }

        setIsLoading(true);
        const token = localStorage.getItem("access_token");

        try {
            const response = await fetch(API_ENDPOINTS.UPDATE_PASSWORD, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
                body: JSON.stringify({ old_password: oldPassword, new_password: newPassword }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.error || "Failed to change password");
            }

            setSuccess("Password changed successfully");
            
            // Clear form fields after successful submission
            setOldPassword("");
            setNewPassword("");
            setConfirmPassword("");
            
            // Close modal after 2 seconds on success
            setTimeout(() => {
                handleClose();
            }, 2000);
        } catch (e) {
            console.error("Error changing password:", e);
            setError(e.message || "Failed to change password. Please check console for details.");
        } finally {
            setIsLoading(false);
        }
    };

    // Get color based on password strength
    const getStrengthColor = () => {
        if (passwordStrength < 40) return "danger";
        if (passwordStrength < 70) return "warning";
        return "success";
    };

    return (
        <>
            <Row>
                <Col>
                    <Button variant="warning" size="sm" onClick={handleShow}>Change Password</Button>
                </Col>
            </Row>

            <Modal show={show} onHide={handleClose} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Change Password</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    {error && <Alert variant="danger">{error}</Alert>}
                    {success && <Alert variant="success">{success}</Alert>}
                    <Form onSubmit={handleChangePassword}>
                        <Form.Group className="mb-3">
                            <Form.Label>Current Password</Form.Label>
                            <div className="input-group">
                                <Form.Control
                                    type={showOldPassword ? "text" : "password"}
                                    name="oldPassword"
                                    value={oldPassword}
                                    onChange={(e) => setOldPassword(e.target.value)}
                                    required
                                />
                                <Button 
                                    variant="outline-secondary"
                                    onClick={() => setShowOldPassword(!showOldPassword)}
                                >
                                    <FontAwesomeIcon icon={showOldPassword ? faEyeSlash : faEye} />
                                </Button>
                            </div>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>New Password</Form.Label>
                            <div className="input-group">
                                <Form.Control
                                    type={showNewPassword ? "text" : "password"}
                                    name="newPassword"
                                    value={newPassword}
                                    onChange={(e) => setNewPassword(e.target.value)}
                                    required
                                />
                                <Button 
                                    variant="outline-secondary"
                                    onClick={() => setShowNewPassword(!showNewPassword)}
                                >
                                    <FontAwesomeIcon icon={showNewPassword ? faEyeSlash : faEye} />
                                </Button>
                            </div>
                            
                            {newPassword && (
                                <div className="mt-2">
                                    <div className="mb-1">Password strength:</div>
                                    <div className="progress mb-3">
                                        <div 
                                            className={`progress-bar bg-${getStrengthColor()}`} 
                                            role="progressbar" 
                                            style={{ width: `${passwordStrength}%` }} 
                                            aria-valuenow={passwordStrength} 
                                            aria-valuemin="0" 
                                            aria-valuemax="100"
                                        ></div>
                                    </div>
                                    
                                    <div className="password-requirements">
                                        {passwordFeedback.map((req, index) => (
                                            <div key={index} className="d-flex align-items-center mb-1">
                                                <FontAwesomeIcon 
                                                    icon={req.regex.test(newPassword) ? faCheckCircle : faTimesCircle} 
                                                    className={`me-2 text-${req.regex.test(newPassword) ? 'success' : 'danger'}`}
                                                />
                                                <small>{req.message}</small>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            )}
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Confirm New Password</Form.Label>
                            <div className="input-group">
                                <Form.Control
                                    type={showConfirmPassword ? "text" : "password"}
                                    name="confirmPassword"
                                    value={confirmPassword}
                                    onChange={(e) => setConfirmPassword(e.target.value)}
                                    required
                                />
                                <Button 
                                    variant="outline-secondary"
                                    onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                                >
                                    <FontAwesomeIcon icon={showConfirmPassword ? faEyeSlash : faEye} />
                                </Button>
                            </div>
                            {confirmPassword && newPassword && (
                                <div className="mt-2">
                                    {confirmPassword === newPassword ? (
                                        <small className="text-success">Passwords match</small>
                                    ) : (
                                        <small className="text-danger">Passwords do not match</small>
                                    )}
                                </div>
                            )}
                        </Form.Group>

                        <Modal.Footer>
                            <Button variant="secondary" onClick={handleClose} disabled={isLoading}>
                                Cancel
                            </Button>
                            <Button 
                                variant="primary" 
                                type="submit" 
                                disabled={isLoading}
                            >
                                {isLoading ? (
                                    <>
                                        <Spinner
                                            as="span"
                                            animation="border"
                                            size="sm"
                                            role="status"
                                            aria-hidden="true"
                                            className="me-2"
                                        />
                                        Saving...
                                    </>
                                ) : (
                                    "Change Password"
                                )}
                            </Button>
                        </Modal.Footer>
                    </Form>
                </Modal.Body>
            </Modal>
        </>
    );
};

export default BtnChangePass;