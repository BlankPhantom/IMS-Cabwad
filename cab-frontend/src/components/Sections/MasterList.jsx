import React, { useState } from "react";
import "../table.css";
import { Button, Container, Table, Col, Row, Modal, Form } from "react-bootstrap";

const Masterlist = () => {
    const [showModal, setShowModal] = useState(false);
    const [formData, setFormData] = useState({
        productName: "",
        classification: "",
        unit: ""
    });

    // Handle opening/closing modal
    const handleShow = () => setShowModal(true);
    const handleClose = () => {
        setShowModal(false);
        setFormData({ productName: "", classification: "", unit: "" }); // Reset form
    };

    // Handle input changes
    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    // Handle form submission
    const handleSubmit = (e) => {
        e.preventDefault();
        console.log("New Item:", formData); // Replace with API call or state update
        handleClose(); // Close modal after submission
    };

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
                        <tr>
                            <th>Item ID</th>
                            <th>Product Name</th>
                            <th>Classification</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {/* DATA ROWS GO HERE */}
                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <Button onClick={handleShow} variant="primary">
                        + Add New Item
                    </Button>
                </Col>
            </Row>

            {/* Add New Item Modal */}
            <Modal show={showModal} size="lg" onHide={handleClose} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Add New Item</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSubmit}>
                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control
                                type="text"
                                name="productName"
                                value={formData.productName}
                                onChange={handleChange}
                                required
                            />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Classification</Form.Label>
                            <Form.Select name="classification" value={formData.classification} onChange={handleChange} required>
                                <option value="">Select Classification</option>
                                <option value="Category A">Category A</option>
                                <option value="Category B">Category B</option>
                                <option value="Category C">Category C</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Unit of Measurement</Form.Label>
                            <Form.Select name="unit" value={formData.unit} onChange={handleChange} required>
                                <option value="">Select Unit</option>
                                <option value="Kg">Kg</option>
                                <option value="L">L</option>
                                <option value="Piece">Piece</option>
                            </Form.Select>
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={handleClose}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                Add New Item
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>
        </Container>
    );
};

export default Masterlist;
