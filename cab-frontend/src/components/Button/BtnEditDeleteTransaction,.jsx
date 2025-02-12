import React, { useState } from 'react';
import { faPenToSquare, faTrashAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button, Modal, Form } from 'react-bootstrap';

const BtnEditDeleteTransaction = ({ onEdit, onDelete, transaction }) => {
    const [showEditModal, setShowEditModal] = useState(false);
    const [formData, setFormData] = useState(transaction);

    const handleEditClick = () => {
        setShowEditModal(true);
    };

    const handleSaveChanges = () => {
        onEdit(formData);
        setShowEditModal(false);
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    return (
        <>
            <td>
                <Button variant="warning" size="sm" style={{ fontSize: "9px", margin: '10px' }} onClick={handleEditClick}>
                    <FontAwesomeIcon icon={faPenToSquare} />
                </Button>
                <Button variant="danger" size="sm" onClick={onDelete} style={{ fontSize: "10px" }}>
                    <FontAwesomeIcon icon={faTrashAlt} />
                </Button>
            </td>

            {/* Edit Modal */}
            <Modal size='lg' show={showEditModal} onHide={() => setShowEditModal(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Edit Transaction</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group controlId="formProductName">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control
                                type="text"
                                name="productName"
                                value={formData.productName}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formItemID">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control
                                type="text"
                                name="itemID"
                                value={formData.itemID}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formPurchasedFromSupplier">
                            <Form.Label>Purchased from Supplier</Form.Label>
                            <Form.Control
                                type="number"
                                name="purchasedFromSupplier"
                                value={formData.purchasedFromSupplier}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formReturnToSupplier">
                            <Form.Label>Return to Supplier</Form.Label>
                            <Form.Control
                                type="number"
                                name="returnToSupplier"
                                value={formData.returnToSupplier}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formTransferFromWarehouse">
                            <Form.Label>Transfer from Warehouse</Form.Label>
                            <Form.Control
                                type="text"
                                name="transferFromWarehouse"
                                value={formData.transferFromWarehouse}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formTransferToWarehouse">
                            <Form.Label>Transfer to Warehouse</Form.Label>
                            <Form.Control
                                type="text"
                                name="transferToWarehouse"
                                value={formData.transferToWarehouse}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formIssuedQuantity">
                            <Form.Label>Issued Quantity</Form.Label>
                            <Form.Control
                                type="number"
                                name="issuedQuantity"
                                value={formData.issuedQuantity}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formReturnedQuantity">
                            <Form.Label>Returned Quantity</Form.Label>
                            <Form.Control
                                type="number"
                                name="returnedQuantity"
                                value={formData.returnedQuantity}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formConsumption">
                            <Form.Label>Consumption</Form.Label>
                            <Form.Control
                                type="number"
                                name="consumption"
                                value={formData.consumption}
                                onChange={handleChange}
                                readOnly
                            />
                        </Form.Group>
                        <Form.Group controlId="formCost">
                            <Form.Label>Cost</Form.Label>
                            <Form.Control
                                type="number"
                                name="cost"
                                value={formData.cost}
                                onChange={handleChange}
                            />
                        </Form.Group>
                        <Form.Group controlId="formTotal">
                            <Form.Label>Total</Form.Label>
                            <Form.Control
                                type="number"
                                name="total"
                                value={formData.total}
                                onChange={handleChange}
                                readOnly
                            />
                        </Form.Group>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShowEditModal(false)}>
                        Cancel
                    </Button>
                    <Button variant="primary" onClick={handleSaveChanges}>
                        Save Changes
                    </Button>
                </Modal.Footer>
            </Modal>
        </>
    );
};

export default BtnEditDeleteTransaction;