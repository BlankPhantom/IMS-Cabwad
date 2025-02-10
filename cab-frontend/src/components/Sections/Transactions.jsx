import React, { useState } from "react";
import "../table.css";
import { Button, Container, Table, Col, Row, Modal, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const Transactions = () => {
    const [showTransactionModal, setShowTransactionModal] = useState(false);
    const [showProductModal, setShowProductModal] = useState(false);
    const [transactions, setTransactions] = useState([]); // State to store all transactions
    const [transactionData, setTransactionData] = useState({
        date: getCurrentDate(),
        week: getWeekNumber(getCurrentDate()),
        mris: "",
        supplier: "",
        requestedBy: "",
        section: "",
        purpose: "",
        area: "",
        products: [] // Stores added products
    });

    const [productData, setProductData] = useState({
        productName: "",
        itemID: "",
        purchasedFromSupplier: "",
        returnToSupplier: "",
        transferFromWarehouse: "",
        transferToWarehouse: "",
        issuedQuantity: "",
        returnedQuantity: "",
        consumption: "",
        cost: "",
        total: ""
    });

    // Handle modal toggling
    const handleShowTransactionModal = () => setShowTransactionModal(true);
    const handleCloseTransactionModal = () => {
        setShowTransactionModal(false);
        setTransactionData({
            date: getCurrentDate(),
            week: getWeekNumber(getCurrentDate()),
            mris: "",
            supplier: "",
            requestedBy: "",
            section: "",
            purpose: "",
            area: "",
            products: [] // Reset products on close
        });
    };

    const handleShowProductModal = () => setShowProductModal(true);
    const handleCloseProductModal = () => setShowProductModal(false);

    // Handle input changes for transaction modal
    const handleTransactionChange = (e) => {
        const { name, value } = e.target;
        let updatedData = { ...transactionData, [name]: value };

        if (name === "date") {
            updatedData.week = getWeekNumber(value);
        }

        setTransactionData(updatedData);
    };

    // Handle input changes for product modal
    const handleProductChange = (e) => {
        setProductData({ ...productData, [e.target.name]: e.target.value });
    };

    // Add product to the list
    const handleAddProduct = (e) => {
        e.preventDefault();
        setTransactionData({
            ...transactionData,
            products: [...transactionData.products, productData] // Append new product
        });

        setProductData({ // Reset product fields
            productName: "",
            itemID: "",
            purchasedFromSupplier: "",
            returnToSupplier: "",
            transferFromWarehouse: "",
            transferToWarehouse: "",
            issuedQuantity: "",
            returnedQuantity: "",
            consumption: "",
            cost: "",
            total: ""
        });

        handleCloseProductModal(); // Close product modal and return to transaction modal
    };

    // Submit transaction
    const handleSubmitTransaction = (e) => {
        e.preventDefault();
        setTransactions([...transactions, transactionData]); // Add new transaction to the list
        console.log("New Transaction Data:", transactionData);
        handleCloseTransactionModal();
    };

    return (
        <Container style={{ width: "100%", margin: '0', padding: '0' }} fluid className="d-flex flex-column justify-content-center mt-5">
            <Row>
                <Col>
                    <MonthYearPicker />
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input type="search" className="" placeholder="Search" style={{ width: "300px" }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Week</th>
                            <th>MRIS/DR</th>
                            <th>Supplier</th>
                            <th>Requested By</th>
                            <th>Section</th>
                            <th>Purpose</th>
                            <th>Item ID</th>
                            <th>Product Name</th>
                            <th>Area</th>
                            <th>Purchased From Supplier</th>
                            <th>Return to Supplier</th>
                            <th>Transfer from Other Warehouse</th>
                            <th>Transfer to Other Warehouse</th>
                            <th>Issued Qty.</th>
                            <th>Returned Qty.</th>
                            <th>Consumption</th>
                            <th>Cost</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        {transactions.length > 0 ? (
                            transactions.map((transaction, tIndex) => (
                                <React.Fragment key={tIndex}>
                                    <tr>
                                        <td rowSpan={transaction.products.length + 1}>{transaction.date}</td>
                                        <td rowSpan={transaction.products.length + 1}>{transaction.week}</td>
                                        <td rowSpan={transaction.products.length + 1}>{transaction.mris}</td>
                                        <td rowSpan={transaction.products.length + 1}>{transaction.supplier}</td>
                                        <td rowSpan={transaction.products.length + 1}>{transaction.requestedBy}</td>
                                        <td rowSpan={transaction.products.length + 1}>{transaction.section}</td>
                                        <td rowSpan={transaction.products.length + 1}>{transaction.purpose}</td>
                                        <td colSpan="12"></td>
                                    </tr>
                                    {transaction.products.map((product, pIndex) => (
                                        <tr key={pIndex}>
                                            <td>{product.itemID}</td>
                                            <td>{product.productName}</td>
                                            <td>{transaction.area}</td>
                                            <td>{product.purchasedFromSupplier}</td>
                                            <td>{product.returnToSupplier}</td>
                                            <td>{product.transferFromWarehouse}</td>
                                            <td>{product.transferToWarehouse}</td>
                                            <td>{product.issuedQuantity}</td>
                                            <td>{product.returnedQuantity}</td>
                                            <td>{product.consumption}</td>
                                            <td>{product.cost}</td>
                                            <td>{product.total}</td>
                                            <td>
                                                <Button variant="warning" size="sm" className="me-2">Edit</Button>
                                                <Button variant="danger" size="sm">Delete</Button>
                                            </td>
                                        </tr>
                                    ))}
                                </React.Fragment>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="20" className="text-center">No transactions available</td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <Button onClick={handleShowTransactionModal} variant="primary">
                        + Record New Transaction
                    </Button>
                </Col>
            </Row>

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
        </Container>
    );
};

export default Transactions;

// Helper functions
function getCurrentDate() {
    const today = new Date();
    return today.toISOString().split("T")[0];
}

function getWeekNumber(dateString) {
    const date = new Date(dateString);
    const startDate = new Date(date.getFullYear(), date.getMonth(), 1);
    const days = Math.floor((date - startDate) / (24 * 60 * 60 * 1000));
    return Math.ceil((days + 1) / 7);
}