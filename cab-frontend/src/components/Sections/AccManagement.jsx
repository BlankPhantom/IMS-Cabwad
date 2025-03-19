import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row, Button, Modal, Form } from "react-bootstrap";
import BtnAddUser from "../Button/BtnAddUser";
import { API_ENDPOINTS } from "../../config";
import { faPenToSquare, faUserSlash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const AccManagement = () => {
    const [users, setUsers] = useState([]);
    const [loading, setLoading] = useState(true);
    const [showEditModal, setShowEditModal] = useState(false);
    const [currentUser, setCurrentUser] = useState({
        id: "",
        first_name: "",
        last_name: "",
        username: "",
        email: "",
        is_superuser: false,
    });
    const [searchTerm, setSearchTerm] = useState("");

    // Fetch users when component mounts
    useEffect(() => {
        fetchUsers();
    }, []);

    const handleDelete = (id) => async () => {
        const token = localStorage.getItem("access_token");
        if (
            !window.confirm(
                "Are you sure you want to delete this user?"
            )
        ) {
            return; // Exit if user cancels
        }
        try {
            const response = await fetch(API_ENDPOINTS.DELETE_USER(id), {
                method: "DELETE",
                headers: {
                    "Authorization": `Token ${token}`,
                }
            });
            if (!response.ok) {
                throw new Error("User Deletion Failed");
            } else {
                fetchUsers();
            }
        } catch (e) {
            console.error("Error deleting user:", e);
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
        // Use only one setCurrentUser call
        setCurrentUser({
            id: user.id,
            first_name: user.first_name || "",
            last_name: user.last_name || "",
            username: user.username,
            email: user.email,
            is_superuser: user.is_superuser,
        });
        setShowEditModal(true);
    };

    const handleCloseEditModal = () => {
        setShowEditModal(false);
    };

    const handleInputChange = (e) => {
        const { name, value, type, checked } = e.target;
        const newValue = type === "checkbox" ? checked : value;
        console.log(`Input changed: ${name} = ${newValue}`);
        setCurrentUser(prev => {
            const updated = {
                ...prev,
                [name]: newValue
            };
            console.log("Updated user state:", updated);
            return updated;
        });
    };

    const handleUpdateUser = async (e) => {
        e.preventDefault();
        const token = localStorage.getItem("access_token");

        try {
            console.log("Sending update with data:", currentUser);

            const response = await fetch(API_ENDPOINTS.UPDATE_USER(currentUser.id), {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
                body: JSON.stringify(currentUser),
            });

            if (!response.ok) {
                const errorData = await response.json().catch(() => null);
                console.error("Update failed with status:", response.status, errorData);
                throw new Error(`Failed to update user: ${response.status}`);
            }

            const updatedUser = await response.json();
            console.log("User updated successfully:", updatedUser);

            // Close modal and refresh user list
            setShowEditModal(false);
            fetchUsers();
        } catch (e) {
            console.error("Error updating user:", e);
            alert("Failed to update user. Please check console for details.");
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

    return (
        <Container fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <h2 className="mt-5" style={{ fontWeight: "650" }}>
                    Account Management
                </h2>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input
                        type="search"
                        className="form-control"
                        placeholder="Search"
                        style={{ width: "300px" }}
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
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
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan="5" className="text-center">
                                    Loading...
                                </td>
                            </tr>
                        ) : filteredUsers.length > 0 ? (
                            filteredUsers.map((user) => (
                                <tr key={user.id}>
                                    <td>{`${user.first_name} ${user.last_name}`}</td>
                                    <td>{user.username}</td>
                                    <td>{user.email}</td>
                                    <td>{user.is_superuser ? "Super Admin" : "Admin"}</td>
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
                                        <Button
                                            variant="danger"
                                            size="sm"
                                            style={{ fontSize: "9px" }}
                                            onClick={handleDelete(user.id)}
                                        >
                                            <FontAwesomeIcon icon={faUserSlash} />
                                        </Button>
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="5" className="text-center">
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
                            <Form.Check
                                type="checkbox"
                                label="Admin Privileges (Superuser)"
                                name="is_superuser"
                                checked={currentUser.is_superuser}
                                onChange={handleInputChange}
                            />
                        </Form.Group>
                        <div className="d-flex justify-content-end">
                            <Button variant="secondary" className="me-2" onClick={handleCloseEditModal}>
                                Cancel
                            </Button>
                            <Button variant="primary" type="submit">
                                Save Changes
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>
        </Container>
    );
};

export default AccManagement;