import React from 'react';
import { Modal, Button, Form } from 'react-bootstrap';

const EditMasterModal = ({ show, handleClose, itemData, handleInputChange, handleSave }) => {
    return (
        <Modal show={show} onHide={handleClose} centered>
            <Modal.Header closeButton>
                <Modal.Title>Edit Item</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group className="mb-3">
                        <Form.Label>Item ID</Form.Label>
                        <Form.Control type="text" name="itemID" value={itemData.itemID} readOnly />
                    </Form.Group>
                    <Form.Group className="mb-3">
                        <Form.Label>Product Name</Form.Label>
                        <Form.Control type="text" name="itemName" value={itemData.itemName} onChange={handleInputChange} />
                    </Form.Group>
                    <Form.Group className="mb-3">
                        <Form.Label>Classification</Form.Label>
                        <Form.Control type="text" name="classificationName" value={itemData.classificationName} onChange={handleInputChange} />
                    </Form.Group>
                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>
                    Cancel
                </Button>
                <Button variant="primary" onClick={handleSave}>
                    Save Changes
                </Button>
            </Modal.Footer>
        </Modal>
    );
};

export default EditMasterModal;