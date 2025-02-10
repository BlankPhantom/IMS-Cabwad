import React, { useEffect } from "react";
import { useState } from "react";
import { API_ENDPOINTS } from "../../config";
import { Button, Modal, Form } from "react-bootstrap";

const BtnAddNewItem = () => {
    const [showModal, setShowModal] = useState(false);
    const [formData, setFormData] = useState({
        classification: 0,
        measurement: 0,
        itemName: "",   
    });
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
        setFormData({ classification: 0, measurement: 0 , itemName: "", }); // Reset form
    };

    // Handle input changes
    const handleChange = async(e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    }; 

    const handleMeasureChange = (e) => {
        const selectedId = e.target.value;
        setSelectedMeasurement(selectedId);
    };
    
    const handleClassificationChange = (e) => {
        const selectedId = e.target.value;
        setSelectedClassification(selectedId);
    };

    // Handle form submission
    const handleSubmit = async(e) => {
        e.preventDefault();
        const formData = new FormData();
        formData.append("itemName", e.target.itemName.value);
        formData.append("classification", selectedClassification);
        formData.append("measurement", selectedMeasurement);

        // Log formData to console with value and type
        for (let [key, value] of formData.entries()) {
            console.log(`${key}: ${value} (type: ${typeof value})`);
            // If you expect some values to be numbers, you can try to parse them
            if (!isNaN(value)) {
                console.log(`${key}: ${value} (parsed type: number)`);
            } else {
                console.log(`${key}: ${value} (parsed type: string)`);
            }
        }

        try{
            const response = await fetch(API_ENDPOINTS.ADD_ITEM, {
                method: "POST",
                body: formData,
            });

            if (!response.ok) {
                const errorData = await response.json();
                alert("Failed to add item: " + errorData.detail);
                console.log(errorData);
            }
            else {
                handleClose(); // Close modal after submission
                alert("Item added successfully!");
                fetchItems(); // Fetch items again to display updated list
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
                                value={formData.itemName}
                                onChange={handleChange}
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