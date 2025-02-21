import React, { useState, useEffect } from "react";
import "../table.css";
import { v4 as uuidv4 } from 'uuid';
import { Container, Table, Col, Row, Button } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import BtnAddTransaction from "../Button/BtnAddTransaction";
import ModalTransaction from "../Modals/ModalTransaction";
import BtnEditDeleteTransaction from "../Button/BtnEditDeleteTransaction";
import { API_ENDPOINTS } from "../../config";

const Transactions = () => {
    const [showTransactionModal, setShowTransactionModal] = useState(false);
    const [showProductModal, setShowProductModal] = useState(false);
    const [transactions, setTransactions] = useState([]); // State to store all transactions
    const [transactionType, setTransactionType] = useState('');
    const [transactionData, setTransactionData] = useState({
        date: getCurrentDate(),
        week: getWeekNumber(getCurrentDate()),
        mris: "",
        supplier: "",
        requestedBy: "",
        section: "",
        purpose: "",
        products: [] // Stores added products
    });

    const [productData, setProductData] = useState({
        transactionType: "",
        productName: "",
        itemID: "",
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
    });

    const [selectedSection, setSelectedSection] = useState("");
    const [selectedPurpose, setSelectedPurpose] = useState("");
    const [selectedProduct, setSelectedProduct] = useState("");
    const [selectedArea, setSelectedArea] = useState("");
    const [products, setProducts] = useState([]);

    useEffect(() => {
        fetchProducts();
        fetchTransactions();
    }, []);

    const fetchTransactions = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.TRANSACTION_LIST);
            const data = await response.json();
            setTransactions(Array.isArray(data) ? data : []); // Ensure it's always an array
        } catch (error) {
            console.error("Error fetching transactions:", error);
            setTransactions([]); // Fallback to empty array
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
            products: [] // Reset products on close
        });
        setSelectedSection('');
        setSelectedPurpose('');
    };

    const handleShowProductModal = () => setShowProductModal(true);

    const handleCloseProductModal = () => {
        setShowProductModal(false);
        setProductData({
            transactionType: "",
            productName: "",
            itemID: "",
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
        });
        setTransactionType('');
        setSelectedProduct('');
        setSelectedArea('');
    };

    const handleCloseTransactionModalND = () => { setShowTransactionModal(false); }

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
                productName: "",
                itemID: "",
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

    // Add product to the list
    const handleAddProduct = (e) => {
        e.preventDefault();
        setTransactionData({
            ...transactionData,
            products: [...transactionData.products, { ...productData, transactionType }] // Append new product with transactionType
        });

        setProductData({ // Reset product fields
            transactionType: "",
            productName: "",
            itemID: "",
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
        });

        setTransactionType('');
        handleCloseProductModal();
        handleShowTransactionModal();
    };

    // Submit transaction
    const handleSubmitTransaction = async (e) => {
        e.preventDefault();

        const formData = {
            date: transactionData.date,
            week: transactionData.week,
            mris: transactionData.mris,
            supplier: transactionData.supplier,
            requestedBy: transactionData.requestedBy,
            sectionID: selectedSection.sectionID,  // Updated
            purposeID: selectedPurpose.purposeID,  // Updated
            products: transactionData.products, // Include all products in the transaction
        };
        console.log("Selected Section:", selectedSection);
        console.log("Selected Purpose:", selectedPurpose);
        const token = localStorage.getItem('access_token');

        try {
            const response = await fetch(API_ENDPOINTS.ADD_TRANSACTION, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(transactionData),
            });

            const result = await response.json();

            if (result.id) {
                // Add products separately
                await Promise.all(transactionData.products.map(product =>
                    fetch(API_ENDPOINTS.ADD_TRANSACTION_PRODUCT, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify({ ...product, transactionDetailID: result.id }),
                    })
                ));
            }

            console.log("Transaction saved:", result);
            fetchTransactions(); // Refresh data
        } catch (error) {
            console.error("Error saving transaction:", error);
        }
    };

    // Handle edit and delete actions
    const handleEdit = (updatedTransaction) => {
        const updatedTransactions = transactions.map(transaction =>
            transaction.id === updatedTransaction.id ? updatedTransaction : transaction
        );
        setTransactions(updatedTransactions);
    };

    const handleDelete = (mris) => {
        const updatedTransactions = transactions.filter(transaction => transaction.mris !== mris);
        setTransactions(updatedTransactions);
    };

    return (
        <Container style={{ width: "100%" }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 className="mt-5" style={{ fontWeight: '650' }}>Transactions</h2>
                </Col>
            </Row>

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
                <div style={{ overflowY: "auto", width: "100%", margiin: "0", padding: "0" }}>
                    <Table responsive bordered striped hover id="TtableStyle" className="tableStyle mt-3">
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
                                <th>Purchased From <br /> Supplier</th>
                                <th>Return to <br /> Supplier</th>
                                <th>Transfer from <br /> Other Warehouse</th>
                                <th>Transfer to <br /> Other Warehouse</th>
                                <th>Issued Qty.</th>
                                <th>Returned Qty.</th>
                                <th>Consumption</th>
                                <th>Cost</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            {Array.isArray(transactions) && transactions.length > 0 ? (
                                transactions.map((transaction, tIndex) => (
                                    <React.Fragment key={tIndex}>
                                        <tr>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>{transaction.date}</td>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>{transaction.week}</td>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>{transaction.mris}</td>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>{transaction.supplier}</td>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>{transaction.requestedBy}</td>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>{transaction.sectionName}</td>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>{transaction.purposeName}</td>
                                            <td colSpan="12"></td>
                                            <td rowSpan={transaction.products?.length + 1 || 2}>
                                                <BtnEditDeleteTransaction
                                                    onEdit={handleEdit}
                                                    onDelete={() => handleDelete(transaction.mris)}
                                                    transaction={transaction}
                                                    handleTransactionChange={handleTransactionChange}
                                                    handleShowProductModal={handleShowProductModal}
                                                    handleCloseTransactionModalND={handleCloseTransactionModalND}
                                                    handleShowTransactionModal={handleShowTransactionModal}
                                                />
                                            </td>
                                        </tr>

                                        {transaction.products && transaction.products.length > 0 ? (
                                            transaction.products.map((product, pIndex) => (
                                                <tr key={`${tIndex}-${pIndex}`}>
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
                                                </tr>
                                            ))
                                        ) : (
                                            <tr>
                                                <td colSpan="12" className="text-center text-muted">No products added</td>
                                            </tr>
                                        )}
                                    </React.Fragment>
                                ))
                            ) : (
                                <tr>
                                    <td colSpan="20" className="text-center">No transactions available</td>
                                </tr>
                            )}
                        </tbody>
                    </Table>
                </div>
            </Row>

            <BtnAddTransaction handleShowTransactionModal={handleShowTransactionModal} />

            <ModalTransaction
                showTransactionModal={showTransactionModal}
                handleShowTransactionModal={handleShowTransactionModal}
                handleCloseTransactionModal={handleCloseTransactionModal}
                handleSubmitTransaction={handleSubmitTransaction}
                transactionData={transactionData}
                handleTransactionChange={handleTransactionChange}
                showProductModal={showProductModal}
                handleCloseProductModal={handleCloseProductModal} // Ensure this is passed correctly
                handleCloseTransactionModalND={handleCloseTransactionModalND}
                handleAddProduct={handleAddProduct}
                productData={productData}
                handleProductChange={handleProductChange}
                handleShowProductModal={handleShowProductModal}
                transactionType={transactionType}
                setTransactionType={setTransactionType}
                handleTransactionTypeChange={handleTransactionTypeChange}
                setProductData={setProductData}
                selectedSection={selectedSection}
                setSelectedSection={setSelectedSection}
                selectedPurpose={selectedPurpose}
                setSelectedPurpose={setSelectedPurpose}
                selectedProduct={selectedProduct}
                setSelectedProduct={setSelectedProduct}
                selectedArea={selectedArea}
                setSelectedArea={setSelectedArea}
                setTransactionData={setTransactionData}
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