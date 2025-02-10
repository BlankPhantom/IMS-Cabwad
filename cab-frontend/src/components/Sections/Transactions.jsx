import React, { useState } from "react";
import "../table.css";
import { Container, Table, Col, Row, Button } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import BtnAddTransaction from "../Button/BtnAddTransaction";
import ModalTransaction from "../Modals/ModalTransaction";

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
        <Container style={{ width: "90%" }} fluid className="d-flex flex-column justify-content-center mt-5">
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

            <BtnAddTransaction handleShowTransactionModal={handleShowTransactionModal} />

            <ModalTransaction
                showTransactionModal={showTransactionModal}
                handleCloseTransactionModal={handleCloseTransactionModal}
                handleSubmitTransaction={handleSubmitTransaction}
                transactionData={transactionData}
                handleTransactionChange={handleTransactionChange}
                showProductModal={showProductModal}
                handleCloseProductModal={handleCloseProductModal}
                handleAddProduct={handleAddProduct}
                productData={productData}
                handleProductChange={handleProductChange}
                handleShowProductModal={handleShowProductModal}
            />
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