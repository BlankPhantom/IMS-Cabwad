import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row, Button } from "react-bootstrap";
import BtnAddUser from "../Button/BtnAddUser";
import { API_ENDPOINTS } from "../../config";
import { faPenToSquare, faUserSlash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const AccManagement = () => {
    const [users, setUsers] = useState([]);
    const [loading, setLoading] = useState(true);

    // Fetch users when component mounts
    useEffect(() => {
        fetchUsers();
    }, []);

    const handleDelete = (id) => async () => {
        const token = localStorage.getItem("access_token");
        if (
            !window.confirm(
                "Are you sure you want to delete this transaction and its associated products?"
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
            })
            if (!response.ok) {
                throw new Error("User Deletion Failed");
            } else {
                fetchUsers();
            }
        } catch (e) {

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
      setLoading(false); // ✅ Set loading to false when done

    } catch (e) {
      console.error("Error fetching users:", e);
      setLoading(false); // ✅ Prevent infinite loading state on error
    }
  };

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
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan="4" className="text-center">
                                    Loading...
                                </td>
                            </tr>
                        ) : users.length > 0 ? (
                            users.map((user) => (
                                <tr key={user.id}>
                                    <td>{`${user.first_name}  ${user.last_name}`}</td>
                                    <td>{user.username}</td>
                                    <td>{user.email}</td>
                                    <td>
                                        <Button variant="warning" size="sm" style={{ fontSize: "9px" }} className="me-2">
                                            <FontAwesomeIcon icon={faPenToSquare} />
                                        </Button>
                                        <Button variant="danger" size="sm" style={{ fontSize: "9px" }} onClick={handleDelete(user.id)}>
                                            <FontAwesomeIcon icon={faUserSlash} />
                                        </Button>
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="4" className="text-center">
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
        </Container>
    );
};

export default AccManagement;
