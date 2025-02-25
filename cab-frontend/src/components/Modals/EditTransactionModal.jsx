import React, { useState, useEffect } from 'react';
import { Modal, Form, Button, Row, Col } from 'react-bootstrap';
import { faPenToSquare, faTrashAlt } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { API_ENDPOINTS } from "../../config";

const EditTransactionModal = ({
    show,
    handleClose,
    handleSubmit,
    transactionData,
    handleChange,
    setEditTransactionData,
    productData,
}) => {
    const [editProductIndex, setEditProductIndex] = useState(null);
    const [editProductData, setEditProductData] = useState({});
    const [sections, setSections] = useState([]);
    const [purpose, setPurpose] = useState([]);
    const [products, setProducts] = useState([]);
    const [area, setArea] = useState([]);
    const [filteredProducts, setFilteredProducts] = useState([]);

    useEffect(() => {
        fetchSections();
        fetchPurpose();
        fetchProducts();
        fetchArea();
    }, []);

    const fetchArea = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.AREA_LIST);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setArea(data);
        } catch (error) {
            console.error("Error fetching area:", error);
        }
    };

    const fetchSections = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.SECTION_LIST);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setSections(data);
        } catch (error) {
            console.error("Error fetching sections:", error);
        }
    };

    const fetchPurpose = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.PURPOSE_LIST);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setPurpose(data);
        } catch (error) {
            console.error("Error fetching purpose:", error);
        }
    };

    const fetchProducts = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.ITEM_LIST);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setProducts(data);
        } catch (error) {
            console.error("Error fetching products:", error);
        }
    };

    const handleEditProduct = (index) => {
        const product = transactionData.products[index];
        setEditProductIndex(index);
        setEditProductData(product);
        setTransactionType(product.transactionType || ''); // Set the transaction type based on the product being edited
        setShowEditProductModal(true);
    };

    const handleDeleteProduct = (index) => {
        const updatedProducts = transactionData.products.filter((_, i) => i !== index);
        setEditTransactionData({ ...transactionData, products: updatedProducts });
    };

    const handleSaveProduct = (e) => {
        e.preventDefault();
        const updatedProducts = [...transactionData.products];
        if (editProductIndex !== null) {
            updatedProducts[editProductIndex] = editProductData;
            setEditProductIndex(null);
        } else {
            updatedProducts.push(productData);
        }
        setEditTransactionData({ ...transactionData, products: updatedProducts });
        setShowEditProductModal(false);
    };

    const handleEditProductChange = (e) => {
        const { name, value } = e.target;
        setEditProductData((prevData) => ({ ...prevData, [name]: value }));
    };

    return (
        <>
            <Modal show={show} size="lg" onHide={handleClose} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Edit Transaction</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSubmit}>
                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Date</Form.Label>
                                    <Form.Control type="date" name="date" value={transactionData.date} onChange={handleChange} disabled />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Week</Form.Label>
                                    <Form.Control type="text" name="week" value={"Week " + transactionData.week} onChange={handleChange} disabled />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Form.Group className="mb-3">
                            <Form.Label>MRIS/DR</Form.Label>
                            <Form.Control type="text" name="mris" value={transactionData.mris} onChange={handleChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Supplier</Form.Label>
                            <Form.Control type="text" name="supplier" value={transactionData.supplier} onChange={handleChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Requested By</Form.Label>
                            <Form.Control type="text" name="requestedBy" value={transactionData.requestedBy} onChange={handleChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Section</Form.Label>
                            <Form.Select name="section" value={transactionData.section} onChange={handleChange} required>
                                <option value="">Select Section</option>
                                <option value="Section A">Section A</option>
                                <option value="Section B">Section B</option>
                                <option value="Section C">Section C</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Purpose</Form.Label>
                            <Form.Select name="purpose" value={transactionData.purpose} onChange={handleChange} required>
                                <option value="">Select Purpose</option>
                                <option value="Purpose A">Purpose A</option>
                                <option value="Purpose B">Purpose B</option>
                                <option value="Purpose C">Purpose C</option>
                            </Form.Select>
                        </Form.Group>

                        <div className="d-flex justify-content-end">
                            <Button onClick={() => setShowProductModal(true)} variant="primary">
                                Add Product
                            </Button>
                        </div>

                        <div className="d-flex justify-content-end gap-2 mt-3">
                            <Button variant="danger" onClick={handleClose}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                Save Changes
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>

            {/* ADD PRODUCT MODAL */}
            {/* <Modal show={showProductModal} onHide={() => setShowProductModal(false)} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Add New Product</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleAddProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Transaction Type</Form.Label>
                            <Form.Select name="transactionType" value={transactionType} onChange={handleTransactionTypeChange} required>
                                <option value="">Select Transaction Type</option>
                                <option value="Purchase/Return">Purchase/Return</option>
                                <option value="Issue/Return">Issue/Return</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control type="text" name="productName" value={productData.productName} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="number" name="itemID" value={productData.itemID} onChange={handleProductChange} />
                        </Form.Group>

                        {transactionType === 'Purchase/Return' && (
                            <>
                                <Form.Group className="mb-3">
                                    <Form.Label>Purchased from Supplier</Form.Label>
                                    <Form.Control type="number" name="purchasedFromSupplier" value={productData.purchasedFromSupplier} onChange={handleProductChange} min="0" />
                                </Form.Group>

                                <Form.Group className="mb-3">
                                    <Form.Label>Return to Supplier</Form.Label>
                                    <Form.Control type="number" name="returnToSupplier" value={productData.returnToSupplier} onChange={handleProductChange} min="0" />
                                </Form.Group>
                            </>
                        )}

                        {transactionType === 'Issue/Return' && (
                            <>
                                <Row>
                                    <Col>
                                        <Form.Group className="mb-3">
                                            <Form.Label>Issued Quantity</Form.Label>
                                            <Form.Control type="number" name="issuedQuantity" value={productData.issuedQuantity} onChange={handleProductChange} min="0" />
                                        </Form.Group>
                                    </Col>
                                    <Col>
                                        <Form.Group className="mb-3">
                                            <Form.Label>Returned Quantity</Form.Label>
                                            <Form.Control type="number" name="returnedQuantity" value={productData.returnedQuantity} onChange={handleProductChange} min="0" />
                                        </Form.Group>
                                    </Col>
                                </Row>
                            </>
                        )}

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer from Warehouse</Form.Label>
                            <Form.Control type="text" name="transferFromWarehouse" value={productData.transferFromWarehouse} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to Warehouse</Form.Label>
                            <Form.Control type="text" name="transferToWarehouse" value={productData.transferToWarehouse} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Cost</Form.Label>
                            <Form.Control type="number" name="cost" value={productData.cost} onChange={handleProductChange} required min="0" />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => setShowProductModal(false)}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                Add New Record
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal> */}

            {/* EDIT PRODUCT MODAL */}
            {/* <Modal show={showEditProductModal} onHide={() => setShowEditProductModal(false)} centered>
                <Modal.Header closeButton>
                    <Modal.Title>{editProductIndex !== null ? "Edit Product" : "Add Product"}</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSaveProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Transaction Type</Form.Label>
                            <Form.Select name="transactionType" value={editProductData.transactionType || productData.transactionType} onChange={handleTransactionTypeChange} required>
                                <option value="">Select Transaction Type</option>
                                <option value="Purchase/Return">Purchase/Return</option>
                                <option value="Issue/Return">Issue/Return</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control type="text" name="productName" value={editProductData.productName || productData.productName} onChange={handleEditProductChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="text" name="itemID" value={editProductData.itemID || productData.itemID} onChange={handleEditProductChange} required />
                        </Form.Group>

                        {transactionType === 'Purchase/Return' && (
                            <>
                                <Form.Group className="mb-3">
                                    <Form.Label>Purchased from Supplier</Form.Label>
                                    <Form.Control type="number" name="purchasedFromSupplier" value={editProductData.purchasedFromSupplier || productData.purchasedFromSupplier} onChange={handleEditProductChange} min="0" />
                                </Form.Group>

                                <Form.Group className="mb-3">
                                    <Form.Label>Return to Supplier</Form.Label>
                                    <Form.Control type="number" name="returnToSupplier" value={editProductData.returnToSupplier || productData.returnToSupplier} onChange={handleEditProductChange} min="0" />
                                </Form.Group>
                            </>
                        )}

                        {transactionType === 'Issue/Return' && (
                            <>
                                <Row>
                                    <Col>
                                        <Form.Group className="mb-3">
                                            <Form.Label>Issued Quantity</Form.Label>
                                            <Form.Control type="number" name="issuedQuantity" value={editProductData.issuedQuantity || productData.issuedQuantity} onChange={handleEditProductChange} min="0" />
                                        </Form.Group>
                                    </Col>
                                    <Col>
                                        <Form.Group className="mb-3">
                                            <Form.Label>Returned Quantity</Form.Label>
                                            <Form.Control type="number" name="returnedQuantity" value={editProductData.returnedQuantity || productData.returnedQuantity} onChange={handleEditProductChange} min="0" />
                                        </Form.Group>
                                    </Col>
                                </Row>
                            </>
                        )}

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer from Warehouse</Form.Label>
                            <Form.Control type="text" name="transferFromWarehouse" value={editProductData.transferFromWarehouse || productData.transferFromWarehouse} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to Warehouse</Form.Label>
                            <Form.Control type="text" name="transferToWarehouse" value={editProductData.transferToWarehouse || productData.transferToWarehouse} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Cost</Form.Label>
                            <Form.Control type="number" name="cost" value={editProductData.cost || productData.cost} onChange={handleEditProductChange} />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => setShowEditProductModal(false)}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                {editProductIndex !== null ? "Save Changes" : "Add Product"}
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal> */}
        </>
    );
};

export default EditTransactionModal;