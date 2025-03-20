import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row, Button, Modal, Form, Badge, Alert, Spinner } from "react-bootstrap";
import BtnAddUser from "../Button/BtnAddUser";
import { API_ENDPOINTS } from "../../config";
import { 
    faPenToSquare, 
    faUserCheck, 
    faUserXmark, 
    faEye, 
    faEyeSlash,
    faCheckCircle,
    faTimesCircle 
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const AccManagement = () => {
    const [users, setUsers] = useState([]);
    const [loading, setLoading] = useState(true);
    const [showEditModal, setShowEditModal] = useState(false);
    const [showConfirmationModal, setShowConfirmationModal] = useState(false);
    const [showActivationModal, setShowActivationModal] = useState(false);
    const [activationAction, setActivationAction] = useState('');
    const [currentUser, setCurrentUser] = useState({
        id: "",
        first_name: "",
        last_name: "",
        username: "",
        email: "",
        is_superuser: false,
        is_active: true,
    });
    const [searchTerm, setSearchTerm] = useState("");
    const [tempUserState, setTempUserState] = useState({
        is_superuser: false
    });
    
    // Password related states
    const [newPassword, setNewPassword] = useState("");
    const [confirmPassword, setConfirmPassword] = useState("");
    const [showNewPassword, setShowNewPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);
    const [passwordStrength, setPasswordStrength] = useState(0);
    const [passwordFeedback, setPasswordFeedback] = useState([]);
    const [error, setError] = useState(null);
    const [success, setSuccess] = useState(null);
    const [isLoading, setIsLoading] = useState(false);

    // Password validation criteria
    const passwordRequirements = [
        { regex: /.{6,}/, message: "At least 6 characters" },
        { regex: /[A-Z]/, message: "At least one uppercase letter" },
        { regex: /[a-z]/, message: "At least one lowercase letter" },
        { regex: /[0-9]/, message: "At least one number" },
    ];

    // Fetch users when component mounts
    useEffect(() => {
        fetchUsers();
    }, []);

    // Password strength calculation
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

    const handleToggleActivation = (user) => {
        setCurrentUser(user);
        setActivationAction(user.is_active ? 'deactivate' : 'activate');
        setShowActivationModal(true);
    };

    const confirmToggleActivation = async () => {
        const token = localStorage.getItem("access_token");
        const newActiveState = !currentUser.is_active;
        
        try {
            // Correct API endpoint for toggling user status
            const response = await fetch(`${API_ENDPOINTS.TOGGLE_USER_ACTIVATION}/${currentUser.id}/`, {
                method: "PATCH",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
                body: JSON.stringify({ is_active: newActiveState }),
            });

            if (!response.ok) {
                throw new Error(`Failed to ${activationAction} user`);
            }

            // Close modal and refresh user list
            setShowActivationModal(false);
            fetchUsers();
        } catch (e) {
            console.error(`Error ${activationAction}ing user:`, e);
            alert(`Failed to ${activationAction} user. Please check console for details.`);
        }
    };

    const fetchUsers = async () => {
        const token = localStorage.getItem("access_token");

        try {
            const response = await fetch(API_ENDPOINTS.USER_LIST, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
            });

            if (!response.ok) {
                throw new Error("Failed to fetch users");
            }

            const data = await response.json();
            setUsers(data);
            setLoading(false);
        } catch (e) {
            console.error("Error fetching users:", e);
            setLoading(false);
        }
    };

    const handleShowEditModal = (user) => {
        // Reset password fields and alerts when opening modal
        setNewPassword("");
        setConfirmPassword("");
        setError(null);
        setSuccess(null);
        
        // Use only one setCurrentUser call
        setCurrentUser({
            id: user.id,
            first_name: user.first_name || "",
            last_name: user.last_name || "",
            username: user.username,
            email: user.email,
            is_superuser: user.is_superuser,
        });
        setTempUserState({
            is_superuser: user.is_superuser
        });
        setShowEditModal(true);
    };

    const handleCloseEditModal = () => {
        setShowEditModal(false);
        setNewPassword("");
        setConfirmPassword("");
        setError(null);
        setSuccess(null);
    };

    const handleInputChange = (e) => {
        const { name, value, type, checked } = e.target;
        
        // If unchecking the superuser checkbox, show confirmation modal
        if (name === "is_superuser" && !checked && currentUser.is_superuser) {
            setTempUserState({
                ...tempUserState,
                is_superuser: false
            });
            setShowConfirmationModal(true);
            return;
        }
        
        const newValue = type === "checkbox" ? checked : value;
        setCurrentUser(prev => {
            const updated = {
                ...prev,
                [name]: newValue
            };
            return updated;
        });
    };

    const confirmRemoveSuperuser = () => {
        setCurrentUser(prev => ({
            ...prev,
            is_superuser: false
        }));
        setShowConfirmationModal(false);
    };

    const cancelRemoveSuperuser = () => {
        setShowConfirmationModal(false);
        // Keep the superuser status as it was
        setCurrentUser(prev => ({
            ...prev,
            is_superuser: true
        }));
    };

    // Password validation
    const validatePassword = () => {
        // Skip validation if no password is entered (not changing password)
        if (!newPassword && !confirmPassword) {
            return true;
        }
        
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

        return true;
    };

    // Get color based on password strength
    const getStrengthColor = () => {
        if (passwordStrength < 40) return "danger";
        if (passwordStrength < 70) return "warning";
        return "success";
    };

    const handleUpdateUser = async (e) => {
        e.preventDefault();
        setError(null);
        setSuccess(null);
        
        if (!validatePassword()) {
            return;
        }
        
        setIsLoading(true);
        const token = localStorage.getItem("access_token");

        // Create payload - only include password if a new one was entered
        const payload = { ...currentUser };
        if (newPassword) {
            payload.password = newPassword;
        }

        try {
            const response = await fetch(API_ENDPOINTS.UPDATE_USER(currentUser.id), {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
                body: JSON.stringify(payload),
            });

            if (!response.ok) {
                const errorData = await response.json().catch(() => null);
                console.error("Update failed with status:", response.status, errorData);
                throw new Error(`Failed to update user: ${response.status}`);
            }

            // Close modal and refresh user list
            setSuccess("User updated successfully!");
            setTimeout(() => {
                setShowEditModal(false);
                fetchUsers();
            }, 1500);
        } catch (e) {
            console.error("Error updating user:", e);
            setError("Failed to update user. Please check console for details.");
        } finally {
            setIsLoading(false);
        }
    };

    const filteredUsers = users.filter(user => {
        const searchTermLower = searchTerm.toLowerCase();
        return (
            user.first_name.toLowerCase().includes(searchTermLower) ||
            user.last_name.toLowerCase().includes(searchTermLower) ||
            user.username.toLowerCase().includes(searchTermLower) ||
            user.email.toLowerCase().includes(searchTermLower)
        );
    });

    // Sort users to ensure the first user in the system is always at the top
    const sortedUsers = [...filteredUsers].sort((a, b) => a.id - b.id);
    const firstUserId = sortedUsers.length > 0 ? sortedUsers[0].id : null;

    return (
        <Container fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <h2 className="mt-5" style={{ fontWeight: "650" }}>
                    Account Management
                </h2>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan="6" className="text-center">
                                    Loading...
                                </td>
                            </tr>
                        ) : sortedUsers.length > 0 ? (
                            sortedUsers.map((user) => (
                                <tr key={user.id} className={!user.is_active ? "table-secondary" : ""}>
                                    <td>{`${user.first_name} ${user.last_name}`}</td>
                                    <td>{user.username}</td>
                                    <td>{user.email}</td>
                                    <td>{user.is_superuser ? "Super Admin" : "Admin"}</td>
                                    <td>
                                        <Badge bg={user.is_active ? "success" : "danger"}>
                                            {user.is_active ? "Active" : "Inactive"}
                                        </Badge>
                                    </td>
                                    <td>
                                        <Button
                                            variant="warning"
                                            size="sm"
                                            style={{ fontSize: "9px" }}
                                            className="me-2"
                                            onClick={() => handleShowEditModal(user)}
                                        >
                                            <FontAwesomeIcon icon={faPenToSquare} />
                                        </Button>
                                        
                                        {/* Don't allow deactivation of first user */}
                                        {user.id !== firstUserId && (
                                            <Button
                                                variant={user.is_active ? "danger" : "success"}
                                                size="sm"
                                                style={{ fontSize: "9px" }}
                                                onClick={() => handleToggleActivation(user)}
                                            >
                                                <FontAwesomeIcon icon={user.is_active ? faUserXmark : faUserCheck} />
                                            </Button>
                                        )}
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="6" className="text-center">
                                    No users found.
                                </td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <BtnAddUser fetchUsers={fetchUsers} />
                </Col>
            </Row>

            {/* Edit User Modal */}
            <Modal show={showEditModal} onHide={handleCloseEditModal}>
                <Modal.Header closeButton>
                    <Modal.Title>Edit User</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    {error && <Alert variant="danger">{error}</Alert>}
                    {success && <Alert variant="success">{success}</Alert>}
                    <Form onSubmit={handleUpdateUser}>
                        <Form.Group className="mb-3">
                            <Form.Label>First Name</Form.Label>
                            <Form.Control
                                type="text"
                                name="first_name"
                                value={currentUser.first_name || ""}
                                onChange={handleInputChange}
                                required
                            />
                        </Form.Group>
                        <Form.Group className="mb-3">
                            <Form.Label>Last Name</Form.Label>
                            <Form.Control
                                type="text"
                                name="last_name"
                                value={currentUser.last_name || ""}
                                onChange={handleInputChange}
                                required
                            />
                        </Form.Group>
                        <Form.Group className="mb-3">
                            <Form.Label>Username</Form.Label>
                            <Form.Control
                                type="text"
                                name="username"
                                value={currentUser.username}
                                onChange={handleInputChange}
                                required
                            />
                        </Form.Group>
                        <Form.Group className="mb-3">
                            <Form.Label>Email</Form.Label>
                            <Form.Control
                                type="email"
                                name="email"
                                value={currentUser.email}
                                onChange={handleInputChange}
                                required
                            />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Confirm New Password</Form.Label>
                            <div className="input-group">
                                <Form.Control
                                    type={showConfirmPassword ? "text" : "password"}
                                    value={confirmPassword}
                                    onChange={(e) => setConfirmPassword(e.target.value)}
                                    disabled={!newPassword}
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
                        
                        <Form.Group className="mb-3">
                            <Form.Check
                                type="checkbox"
                                label="Admin Privileges (Superuser)"
                                name="is_superuser"
                                checked={currentUser.is_superuser}
                                onChange={handleInputChange}
                            />
                        </Form.Group>
                        <div className="d-flex justify-content-end">
                            <Button variant="danger" className="me-2" onClick={handleCloseEditModal} disabled={isLoading}>
                                Cancel
                            </Button>
                            <Button variant="primary" type="submit" disabled={isLoading}>
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
                                    "Save Changes"
                                )}
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>

            {/* Confirmation Modal for removing superuser privileges */}
            <Modal show={showConfirmationModal} size="sm" onHide={cancelRemoveSuperuser} centered>
                <Modal.Header>
                    <Modal.Title style={{fontSize: '18px'}}>Remove Admin Privileges</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <p>Are you sure you want to remove admin privileges from this user?</p>
                    <p>This action will revoke their ability to manage other users.</p>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" size="sm" onClick={cancelRemoveSuperuser}>
                        Cancel
                    </Button>
                    <Button variant="danger" size="sm" onClick={confirmRemoveSuperuser}>
                        Remove Privileges
                    </Button>
                </Modal.Footer>
            </Modal>

            {/* Activation Toggle Modal */}
            <Modal show={showActivationModal} size="sm" onHide={() => setShowActivationModal(false)} centered>
                <Modal.Header>
                    <Modal.Title style={{fontSize: '18px'}}>{activationAction === 'activate' ? 'Activate User' : 'Deactivate User'}</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    {activationAction === 'activate' ? (
                        <p>Are you sure you want to activate this user account? They will regain access to the system.</p>
                    ) : (
                        <p>Are you sure you want to deactivate this user account? They will lose access to the system but all data will be preserved.</p>
                    )}
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" size="sm" onClick={() => setShowActivationModal(false)}>
                        Cancel
                    </Button>
                    <Button 
                        variant={activationAction === 'activate' ? "success" : "danger"} 
                        size="sm" 
                        onClick={confirmToggleActivation}
                    >
                        {activationAction === 'activate' ? 'Activate User' : 'Deactivate User'}
                    </Button>
                </Modal.Footer>
            </Modal>
        </Container>
    );
};

export default AccManagement;