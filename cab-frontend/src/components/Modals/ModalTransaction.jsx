import { faPenToSquare, faTrashAlt } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React, { useState } from 'react';
import { Modal, Form, Button, Row, Col } from 'react-bootstrap';

const ModalTransaction = ({
    showTransactionModal,
    handleShowTransactionModal,
    handleCloseTransactionModal,
    handleCloseTransactionModalND,
    handleSubmitTransaction,
    transactionData,
    handleTransactionChange,
    showProductModal,
    handleCloseProductModal,
    handleAddProduct,
    transactionType,
    setTransactionType,
    productData,
    handleProductChange,
    handleShowProductModal,
    setProductData
}) => {
    const [editProductIndex, setEditProductIndex] = useState(null);
    const [showEditProductModal, setShowEditProductModal] = useState(false);
    const [editProductData, setEditProductData] = useState({});

    const handleTransactionTypeChange = (e) => {
        const { value } = e.target;
        setTransactionType(value);

        if (showEditProductModal) {
            setEditProductData((prevData) => ({
                ...prevData,
                transactionType: value,
                purchasedFromSupplier: "",
                returnToSupplier: "",
                issuedQuantity: "",
                returnedQuantity: "",
                consumption: "",
            }));
        } else {
            setProductData((prevData) => ({
                ...prevData,
                transactionType: value,
                area: "",
                purchasedFromSupplier: "",
                returnToSupplier: "",
                transferFromWarehouse: "",
                transferToWarehouse: "",
                issuedQuantity: "",
                returnedQuantity: "",
                consumption: "",
                cost: "",
                total: ""
            }));
        }
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

    const handleEditProduct = (index) => {
        const product = transactionData.products[index];
        setEditProductIndex(index);
        setEditProductData(product);
        setTransactionType(product.transactionType || ''); // Set the transaction type based on the product being edited
        setShowEditProductModal(true);
    };

    const handleDeleteProduct = (index) => {
        const updatedProducts = transactionData.products.filter((_, i) => i !== index);
        handleTransactionChange({ target: { name: 'products', value: updatedProducts } });
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
        handleTransactionChange({ target: { name: 'products', value: updatedProducts } });
        setShowEditProductModal(false);
        handleCloseProductModal();
    };

    const handleEditProductChange = (e) => {
        const { name, value } = e.target;
        setEditProductData((prevData) => ({ ...prevData, [name]: value }));
    };

    return (
        <>
            <Modal show={showTransactionModal} size="lg" onHide={handleCloseTransactionModal} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Record New Transaction</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSubmitTransaction}>
                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Date</Form.Label>
                                    <Form.Control type="date" name="date" value={transactionData.date} onChange={handleTransactionChange} disabled />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Week</Form.Label>
                                    <Form.Control type="text" name="week" value={"Week " + transactionData.week} onChange={handleTransactionChange} disabled />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Form.Group className="mb-3">
                            <Form.Label>MRIS/DR</Form.Label>
                            <Form.Control type="number" name="mris" value={transactionData.mris} onChange={handleTransactionChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Supplier</Form.Label>
                            <Form.Control type="text" name="supplier" value={transactionData.supplier} onChange={handleTransactionChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Requested By</Form.Label>
                            <Form.Control type="text" name="requestedBy" value={transactionData.requestedBy} onChange={handleTransactionChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Section</Form.Label>
                            <Form.Select name="section" value={transactionData.section} onChange={handleTransactionChange} required>
                                <option value="">Select Section</option>
                                <option value="Section A">Section A</option>
                                <option value="Section B">Section B</option>
                                <option value="Section C">Section C</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Purpose</Form.Label>
                            <Form.Select name="purpose" value={transactionData.purpose} onChange={handleTransactionChange} required>
                                <option value="">Select Purpose</option>
                                <option value="Purpose A">Purpose A</option>
                                <option value="Purpose B">Purpose B</option>
                                <option value="Purpose C">Purpose C</option>
                            </Form.Select>
                        </Form.Group>

                        <div className="d-flex justify-content-end">
                            <Button onClick={() => { handleShowProductModal(); handleCloseTransactionModalND(); }} variant="primary">
                                Add Product
                            </Button>
                        </div>

                        {/* Product List */}
                        <h5 className="mt-3">Product List</h5>

                        <ul className="mt-3">
                            {transactionData.products.map((product, index) => (
                                <li key={index}>
                                    {product.productName}
                                    <span
                                        style={{ color: "#ffcc00", marginRight: '5px', marginLeft: '5px', cursor: "pointer" }}
                                        onClick={() => { handleEditProduct(index); handleCloseTransactionModalND(); }}
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
                            <Button variant="danger" onClick={handleCloseTransactionModal}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                Record New Transaction
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>

            {/* ADD PRODUCT MODAL */}
            <Modal show={showProductModal} onHide={handleCloseProductModal} centered>
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

                        <Form.Group className="mb-3">
                            <Form.Label>Area</Form.Label>
                            <Form.Select name="area" value={productData.area} onChange={handleProductChange} required>
                                <option value="">Select Area</option>
                                <option value="Area A">Area A</option>
                                <option value="Area B">Area B</option>
                                <option value="Area C">Area C</option>
                            </Form.Select>
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

                                <Form.Group className="mb-3">
                                    <Form.Label>Consumption</Form.Label>
                                    <Form.Control type="number" name="consumption" value={calculateConsumption(productData)} readOnly />
                                </Form.Group>
                            </>
                        )}

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer from other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferFromWarehouse" value={productData.transferFromWarehouse} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferToWarehouse" value={productData.transferToWarehouse} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Cost</Form.Label>
                            <Form.Control type="number" name="cost" value={productData.cost} onChange={handleProductChange} required min="0" />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Total</Form.Label>
                            <Form.Control type="number" name="total" value={calculateTotal(productData)} readOnly />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { handleCloseProductModal(); handleShowTransactionModal(); }}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                Add New Record
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>

            {/* EDIT PRODUCT MODAL */}
            <Modal show={showEditProductModal} onHide={() => setShowEditProductModal(false)} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Edit Product</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSaveProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Transaction Type</Form.Label>
                            <Form.Select name="transactionType" value={editProductData.transactionType} onChange={handleTransactionTypeChange} required>
                                <option value="">Select Transaction Type</option>
                                <option value="Purchase/Return">Purchase/Return</option>
                                <option value="Issue/Return">Issue/Return</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control type="text" name="productName" value={editProductData.productName} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="number" name="itemID" value={editProductData.itemID} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Area</Form.Label>
                            <Form.Select name="area" value={editProductData.area} onChange={handleEditProductChange} required>
                                <option value="">Select Area</option>
                                <option value="Area A">Area A</option>
                                <option value="Area B">Area B</option>
                                <option value="Area C">Area C</option>
                            </Form.Select>
                        </Form.Group>

                        {transactionType === 'Purchase/Return' && (
                            <>
                                <Form.Group className="mb-3">
                                    <Form.Label>Purchased from Supplier</Form.Label>
                                    <Form.Control type="number" name="purchasedFromSupplier" value={editProductData.purchasedFromSupplier} onChange={handleEditProductChange} min="0" />
                                </Form.Group>

                                <Form.Group className="mb-3">
                                    <Form.Label>Return to Supplier</Form.Label>
                                    <Form.Control type="number" name="returnToSupplier" value={editProductData.returnToSupplier} onChange={handleEditProductChange} min="0" />
                                </Form.Group>
                            </>
                        )}

                        {transactionType === 'Issue/Return' && (
                            <>
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

                                <Form.Group className="mb-3">
                                    <Form.Label>Consumption</Form.Label>
                                    <Form.Control type="number" name="consumption" value={calculateConsumption(editProductData)} readOnly />
                                </Form.Group>
                            </>
                        )}

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer from other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferFromWarehouse" value={editProductData.transferFromWarehouse} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferToWarehouse" value={editProductData.transferToWarehouse} onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Cost</Form.Label>
                            <Form.Control type="number" name="cost" value={editProductData.cost} onChange={handleEditProductChange} required min="0" />
                        </Form.Group>


                        <Form.Group className="mb-3">
                            <Form.Label>Total</Form.Label>
                            <Form.Control type="number" name="total" value={calculateTotal(editProductData)} readOnly />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { setShowEditProductModal(false); handleShowTransactionModal(); }}>
                                Cancel
                            </Button>
                            <Button type="submit" onClick={() => { handleShowTransactionModal() }} variant="primary">
                                Save Changes
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>
        </>
    );
};

export default ModalTransaction;