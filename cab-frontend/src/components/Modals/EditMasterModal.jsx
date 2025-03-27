import React, { useEffect } from 'react';
import { useState } from 'react';
import { Modal, Button, Form } from 'react-bootstrap';

const EditMasterModal = ({ show, handleClose, itemData, handleInputChange, handleSave, classifications, measurements}) => {
    const [selectedMeasurement, setSelectedMeasurement] = useState('');
    const [selectedClassification, setSelectedClassification] = useState('');

    useEffect(() => {
        setSelectedMeasurement(itemData?.measurementID || '');
        setSelectedClassification(itemData?.classificationID || '');
    }, [itemData]);

    const handleMeasureChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedMeasurement(selectedId);
        handleInputChange({
            target: {
                name: 'measurementID',
                value: selectedId,
            }
        });
    };
    
    const handleClassificationChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedClassification(selectedId);
        handleInputChange({
            target: {
                name: 'classificationID',
                value: selectedId,
            }
        });
    };

    const onSave = (e) => {
        e.preventDefault();
        const updatedItemData = {
            ...itemData,
            classificationID: selectedClassification,
            measurementID: selectedMeasurement
        };
        handleSave(updatedItemData);
    };

    return (
        <Modal show={show} onHide={handleClose} centered>
            <Modal.Header closeButton>
                <Modal.Title>Edit Item</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form onSubmit={onSave}>
                    <Form.Group className="mb-3">
                        <Form.Label>Item ID</Form.Label>
                        <Form.Control type="text" name="itemID" value={itemData?.itemID} readOnly />
                    </Form.Group>
                    <Form.Group className="mb-3">
                        <Form.Label>Product Name</Form.Label>
                        <Form.Control type="text" name="itemName" value={itemData?.itemName} onChange={handleInputChange} />
                    </Form.Group>
                    <Form.Group className="mb-3">
                        <Form.Label>Classification</Form.Label>
                        <Form.Select 
                            name="classificationID" 
                            value={selectedClassification}
                            onChange={handleClassificationChange} 
                            required 
                            disabled>
                            <option value="">{itemData?.classificationName}</option>
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
                            name="measurementID" 
                            value={selectedMeasurement}
                            onChange={handleMeasureChange} 
                            required>
                            <option value="">{itemData?.measurementName}</option>
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
                            value={itemData?.unitCost}
                            onChange={handleInputChange}
                            >
                        </Form.Control>
                    </Form.Group>
                    <Form.Group className='d-flex justify-content-end'> 
                        <Button variant="danger" onClick={handleClose} className='me-2'>
                            Cancel
                        </Button>
                        <Button type="submit" variant="primary">
                            Save Changes
                        </Button>
                    </Form.Group>
                </Form>
            </Modal.Body>
            <Modal.Footer>
                
            </Modal.Footer>
        </Modal>
    );
};

export default EditMasterModal;