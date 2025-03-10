import React, { useEffect } from "react";
import { useState } from "react";
import { API_ENDPOINTS } from "../../config";
import { Button, Modal, Form } from "react-bootstrap";

const BtnAddNewItem = ({ fetchItems, classifications, measurements }) => {
    const [showModal, setShowModal] = useState(false);
    const [selectedMeasurement, setSelectedMeasurement] = useState('');
    const [selectedClassification, setSelectedClassification] = useState('');

    // Handle opening/closing modal
    const handleShow = () => setShowModal(true);
    const handleClose = () => {
        setShowModal(false);
        setSelectedMeasurement('');
        setSelectedClassification('');
    };

    const handleMeasureChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedMeasurement(selectedId);
    };

    const handleClassificationChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedClassification(selectedId);
    };

    // Handle form submission
    const handleSubmit = async (e) => {
        e.preventDefault();
        const formData = {
            itemName: e.target.itemName.value,
            classificationID: selectedClassification,
            measurementID: selectedMeasurement,
            unitCost: e.target.unitCost.value,
        };

        const token = localStorage.getItem('access_token');

        try {
            const response = await fetch(API_ENDPOINTS.ADD_ITEM, {
                method: "POST",
                headers: {
                    'Content-Type': 'application/json', // Ensure the server knows it's JSON
                    'Authorization': `Token ${token}`,
                },
                body: JSON.stringify(formData),
            });

            if (!response.ok) {
                const errorData = await response.json();
                alert("Failed to add item: " + errorData.detail);
            }
            else {
                handleClose(); // Close modal after submission
                alert("Item added successfully!");
                fetchItems();
            }
        } catch (e) {
            console.error("Error adding item:", e);
        }
    };

    return (
        <>
            <Button onClick={handleShow} variant="primary">
                + Add New Item
            </Button>

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
                                name="itemName"
                                required
                            />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Classification</Form.Label>
                            <Form.Select
                                name="classification"
                                value={selectedClassification}
                                onChange={handleClassificationChange}
                                required>
                                <option value="">Select Classification</option>
                                {classifications.map((classification) => (
                                    <option key={classification.id} value={classification.classificationID}>
                                        {classification.classification}
                                    </option>
                                ))}
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Unit of Measurement</Form.Label>
                            <Form.Select
                                name="measurement"
                                value={selectedMeasurement}
                                onChange={handleMeasureChange}
                                required>
                                <option value="">Select Measurement</option>
                                {measurements.map((measurement) => (
                                    <option key={measurement.id} value={measurement.measurementID}>
                                        {measurement.measureName}
                                    </option>
                                ))}
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Unit Cost</Form.Label>
                            <Form.Control
                                name="unitCost"
                                type="number"
                                min="0" step="0.01" 
                            >
                            </Form.Control>
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
        </>
    );
};

export default BtnAddNewItem;