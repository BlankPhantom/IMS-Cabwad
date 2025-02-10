import React from 'react';
import { Modal, Form, Button, Row, Col } from 'react-bootstrap';

const ModalTransaction = ({
    showTransactionModal,
    handleCloseTransactionModal,
    handleSubmitTransaction,
    transactionData,
    handleTransactionChange,
    showProductModal,
    handleCloseProductModal,
    handleAddProduct,
    productData,
    handleProductChange,
    handleShowProductModal
}) => {
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
                            <Form.Control type="text" name="mris" value={transactionData.mris} onChange={handleTransactionChange} required />
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

                        <Form.Group className="mb-3">
                            <Form.Label>Area</Form.Label>
                            <Form.Select name="area" value={transactionData.area} onChange={handleTransactionChange} required>
                                <option value="">Select Area</option>
                                <option value="Area A">Area A</option>
                                <option value="Area B">Area B</option>
                                <option value="Area C">Area C</option>
                            </Form.Select>
                        </Form.Group>

                        <div className="d-flex justify-content-end">
                            <Button onClick={handleShowProductModal} variant="primary">
                                Add Product
                            </Button>
                        </div>

                        {/* Product List */}
                        <ul className="mt-3">
                            {transactionData.products.map((product, index) => (
                                <li key={index}>
                                    {product.productName} <span style={{ color: "red", cursor: "pointer" }}>🗑</span>
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

            {/* INDIVIDUAL PRODUCT RECORD MODAL */}
            <Modal show={showProductModal} onHide={handleCloseProductModal} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Individual Product Record</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleAddProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control type="text" name="productName" value={productData.productName} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="number" name="itemID" value={productData.itemID} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Purchased from Supplier</Form.Label>
                            <Form.Control type="number" name="purchasedFromSupplier" value={productData.purchasedFromSupplier} onChange={handleProductChange} required min="0" />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Return to Supplier</Form.Label>
                            <Form.Control type="number" name="returnToSupplier" value={productData.returnToSupplier} onChange={handleProductChange} required min="0" />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer from other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferFromWarehouse" value={productData.transferFromWarehouse} onChange={handleProductChange} required />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to other Warehouse</Form.Label>
                            <Form.Control type="text" name="transferToWarehouse" value={productData.transferToWarehouse} onChange={handleProductChange} required />
                        </Form.Group>

                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Issued Quantity</Form.Label>
                                    <Form.Control type="number" name="issuedQuantity" value={productData.issuedQuantity} onChange={handleProductChange} required min="0" />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Returned Quantity</Form.Label>
                                    <Form.Control type="number" name="returnedQuantity" value={productData.returnedQuantity} onChange={handleProductChange} required min="0" />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Row>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Consumption</Form.Label>
                                    <Form.Control type="number" name="consumption" value={productData.consumption} onChange={handleProductChange} />
                                </Form.Group>
                            </Col>
                            <Col>
                                <Form.Group className="mb-3">
                                    <Form.Label>Cost</Form.Label>
                                    <Form.Control type="number" name="cost" value={productData.cost} onChange={handleProductChange} required min="0" />
                                </Form.Group>
                            </Col>
                        </Row>

                        <Form.Group className="mb-3">
                            <Form.Label>Total</Form.Label>
                            <Form.Control type="number" name="total" value={productData.total} onChange={handleProductChange} />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={handleCloseProductModal}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
                                Add New Record
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>
        </>
    );
};

export default ModalTransaction;