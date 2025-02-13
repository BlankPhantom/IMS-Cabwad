import React, { useState } from 'react';
import { faPenToSquare, faTrashAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button, Modal, Form, Row, Col } from 'react-bootstrap';

const BtnEditDeleteTransaction = ({
    onEdit,
    onDelete,
    transaction,
    handleShowTransactionModal
}) => {
    const [showEditModal, setShowEditModal] = useState(false);
    const [showAddProductModal, setShowAddProductModal] = useState(false);
    const [showEditProductModal, setShowEditProductModal] = useState(false);
    const [formData, setFormData] = useState(transaction);
    const [productData, setProductData] = useState({});
    const [editProductData, setEditProductData] = useState({});
    const [editProductIndex, setEditProductIndex] = useState(null);

    const handleEditClick = () => {
        setShowEditModal(true);
    };

    const handleSaveChanges = (e) => {
        e.preventDefault();
        onEdit(formData);
        setShowEditModal(false);
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleAddProduct = (e) => {
        e.preventDefault();
        setFormData({
            ...formData,
            products: [...formData.products, productData]
        });
        setProductData({});
        setShowAddProductModal(false);
    };

    const handleAddProductChange = (e) => {
        const { name, value } = e.target;
        setProductData((prevData) => ({ ...prevData, [name]: value }));
    };

    const handleEditProduct = (index) => {
        const product = formData.products[index];
        setEditProductIndex(index);
        setEditProductData(product);
        setShowEditProductModal(true);
    };

    const handleSaveProduct = (e) => {
        e.preventDefault();
        const updatedProducts = [...formData.products];
        updatedProducts[editProductIndex] = editProductData;
        setFormData({ ...formData, products: updatedProducts });
        setShowEditProductModal(false);
    };

    const handleEditProductChange = (e) => {
        const { name, value } = e.target;
        setEditProductData((prevData) => ({ ...prevData, [name]: value }));
    };

    const handleDeleteProduct = (index) => {
        const updatedProducts = formData.products.filter((_, i) => i !== index);
        setFormData({ ...formData, products: updatedProducts });
    };

    const calculateConsumption = (data) => {
        const issued = parseInt(data.issuedQuantity) || 0;
        const returned = parseInt(data.returnedQuantity) || 0;
        return returned - issued;
    };

    const calculateTotal = (data) => {
        const purchased = parseInt(data.purchasedFromSupplier) || 0;
        const consumption = calculateConsumption(data);
        const cost = parseFloat(data.cost) || 0;
        return Math.abs(purchased || consumption) * cost;
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

            {/* Edit Transaction Modal */}
            <Modal show={showEditModal} size='lg' onHide={() => setShowEditModal(false)} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Edit Transaction</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSaveChanges}>
                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Date</Form.Label>
                                    <Form.Control type="date" name="date" value={formData.date} onChange={handleChange} disabled />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Week</Form.Label>
                                    <Form.Control type="text" name="week" value={"Week " + formData.week} onChange={handleChange} disabled />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Form.Group className="mb-3">
                            <Form.Label>MRIS/DR</Form.Label>
                            <Form.Control type="text" name="mris" value={formData.mris} onChange={handleChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Supplier</Form.Label>
                            <Form.Control type="text" name="supplier" value={formData.supplier} onChange={handleChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Requested By</Form.Label>
                            <Form.Control type="text" name="requestedBy" value={formData.requestedBy} onChange={handleChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Section</Form.Label>
                            <Form.Select name="section" value={formData.section} onChange={handleChange} required>
                                <option value="">Select Section</option>
                                <option value="Section A">Section A</option>
                                <option value="Section B">Section B</option>
                                <option value="Section C">Section C</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Purpose</Form.Label>
                            <Form.Select name="purpose" value={formData.purpose} onChange={handleChange} required>
                                <option value="">Select Purpose</option>
                                <option value="Purpose A">Purpose A</option>
                                <option value="Purpose B">Purpose B</option>
                                <option value="Purpose C">Purpose C</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Area</Form.Label>
                            <Form.Select name="area" value={formData.area} onChange={handleChange} required>
                                <option value="">Select Area</option>
                                <option value="Area A">Area A</option>
                                <option value="Area B">Area B</option>
                                <option value="Area C">Area C</option>
                            </Form.Select>
                        </Form.Group>

                        <div className="d-flex justify-content-end">
                            <Button onClick={() => { setShowAddProductModal(true); setShowEditModal(false); }} variant="primary">
                                Add Product
                            </Button>
                        </div>

                        {/* Product List */}
                        <h5 className="mt-3">Product List</h5>

                        <ul className="mt-3">
                            {formData.products.map((product, index) => (
                                <li key={index}>
                                    {product.productName}
                                    <span
                                        style={{ color: "#ffcc00", marginRight: '5px', marginLeft: '5px', cursor: "pointer" }}
                                        onClick={() => { handleEditProduct(index); setShowEditModal(false); }}
                                    >
                                        <FontAwesomeIcon icon={faPenToSquare} />
                                    </span>
                                    <span
                                        style={{ color: "red", cursor: "pointer" }}
                                        onClick={() => handleDeleteProduct(index)}
                                    >
                                        <FontAwesomeIcon icon={faTrashAlt} />
                                    </span>
                                </li>
                            ))}
                        </ul>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { setShowEditModal(false); handleShowTransactionModal(); }}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                Save Changes
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>

            {/* Add Product Modal */}
            <Modal show={showAddProductModal} onHide={() => setShowAddProductModal(false)} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Add New Product</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleAddProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control type="text" name="productName" value={productData.productName} onChange={handleAddProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="number" name="itemID" value={productData.itemID} onChange={handleAddProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Purchased from Supplier</Form.Label>
                            <Form.Control type="number" name="purchasedFromSupplier" value={productData.purchasedFromSupplier} onChange={handleAddProductChange} min="0" />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Return to Supplier</Form.Label>
                            <Form.Control type="number" name="returnToSupplier" value={productData.returnToSupplier} onChange={handleAddProductChange} min="0" />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer from other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferFromWarehouse" value={productData.transferFromWarehouse} onChange={handleAddProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferToWarehouse" value={productData.transferToWarehouse} onChange={handleAddProductChange} />
                        </Form.Group>

                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Issued Quantity</Form.Label>
                                    <Form.Control type="number" name="issuedQuantity" value={productData.issuedQuantity} onChange={handleAddProductChange} min="0" />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Returned Quantity</Form.Label>
                                    <Form.Control type="number" name="returnedQuantity" value={productData.returnedQuantity} onChange={handleAddProductChange} min="0" />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Consumption</Form.Label>
                                    <Form.Control type="number" name="consumption" value={calculateConsumption(productData)} readOnly />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Cost</Form.Label>
                                    <Form.Control type="number" name="cost" value={productData.cost} onChange={handleAddProductChange} required min="0" />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Form.Group className="mb-3">
                            <Form.Label>Total</Form.Label>
                            <Form.Control type="number" name="total" value={calculateTotal(productData)} readOnly />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { setShowAddProductModal(false); setShowEditModal(true); }}>
                                Cancel
                            </Button>
                            <Button type="submit" onClick={() => setShowEditModal(true)} variant="primary">
                                Add Product
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>

            {/* Edit Product Modal */}
            <Modal show={showEditProductModal} onHide={() => setShowEditProductModal(false)} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Edit Product</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSaveProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control type="text" name="productName" value={editProductData.productName} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="number" name="itemID" value={editProductData.itemID} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Purchased from Supplier</Form.Label>
                            <Form.Control type="number" name="purchasedFromSupplier" value={editProductData.purchasedFromSupplier} onChange={handleEditProductChange} min="0" />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Return to Supplier</Form.Label>
                            <Form.Control type="number" name="returnToSupplier" value={editProductData.returnToSupplier} onChange={handleEditProductChange} min="0" />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer from other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferFromWarehouse" value={editProductData.transferFromWarehouse} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferToWarehouse" value={editProductData.transferToWarehouse} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Issued Quantity</Form.Label>
                                    <Form.Control type="number" name="issuedQuantity" value={editProductData.issuedQuantity} onChange={handleEditProductChange} min="0" />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Returned Quantity</Form.Label>
                                    <Form.Control type="number" name="returnedQuantity" value={editProductData.returnedQuantity} onChange={handleEditProductChange} min="0" />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Consumption</Form.Label>
                                    <Form.Control type="number" name="consumption" value={calculateConsumption(editProductData)} readOnly />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Cost</Form.Label>
                                    <Form.Control type="number" name="cost" value={editProductData.cost} onChange={handleEditProductChange} required min="0" />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Form.Group className="mb-3">
                            <Form.Label>Total</Form.Label>
                            <Form.Control type="number" name="total" value={calculateTotal(editProductData)} readOnly />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { setShowEditProductModal(false); setShowEditModal(true); }}>
                                Cancel
                            </Button>
                            <Button type="submit" onClick={() => setShowEditModal(true)} variant="primary">
                                Save Changes
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>
        </>
    );
};

export default BtnEditDeleteTransaction;