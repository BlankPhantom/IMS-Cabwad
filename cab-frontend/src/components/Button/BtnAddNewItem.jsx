import React, { useEffect } from "react";
import { useState } from "react";
import { API_ENDPOINTS } from "../../config";
import { Button, Modal, Form } from "react-bootstrap";

const BtnAddNewItem = ({fetchItems}) => {
    const [showModal, setShowModal] = useState(false);
    const [selectedClassification, setSelectedClassification] = useState('');
    const [classifications, setClassifications] = useState([]);
    const [selectedMeasurement, setSelectedMeasurement] = useState('');
    const [measurements, setMeasurements] = useState([]);

    const fetchClassifications = async() => {
        try {
            const response = await fetch(API_ENDPOINTS.CLASSIFICATIONS_LIST);
            if (!response.ok) {
                throw new Error("Failed to fetch classifications");
            }
            const data = await response.json();
            setClassifications(data);
        } catch (e) {
            console.error("Error fetching classifications:", e);
        }
    }

    const fetchMeasurements = async() => {
        try {
            const response = await fetch(API_ENDPOINTS.MEASUREMENTS_LIST);
            if (!response.ok) {
                throw new Error("Failed to fetch measurements");
            }
            const data = await response.json();
            setMeasurements(data);
        }
        catch{
            console.error("Error fetching measurements:", e);
        }
    }

    useEffect(() => {
        fetchClassifications();
        fetchMeasurements(); 
    }, []);

    // Handle opening/closing modal
    const handleShow = () => setShowModal(true);
    const handleClose = () => {
        setShowModal(false);
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
    const handleSubmit = async(e) => {
        e.preventDefault();
        const formData = {
            itemName: e.target.itemName.value,
            classificationID: selectedClassification,
            measurementID: selectedMeasurement,
        };

        try{
            const response = await fetch(API_ENDPOINTS.ADD_ITEM, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json", // Ensure the server knows it's JSON
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

    return(
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