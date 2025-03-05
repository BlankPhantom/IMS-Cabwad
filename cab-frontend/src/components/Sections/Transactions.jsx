import React, { useState, useEffect } from "react";
import "../table.css";
import { v4 as uuidv4 } from 'uuid';
import { Container, Table, Col, Row, Button } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import BtnAddTransaction from "../Button/BtnAddTransaction";
import ModalTransaction from "../Modals/ModalTransaction";
import BtnEditDeleteTransaction from "../Button/BtnEditDeleteTransaction";
import { API_ENDPOINTS } from "../../config";
import EditTransactionModal from "../Modals/EditTransactionModal";

const Transactions = () => {
    const [showTransactionModal, setShowTransactionModal] = useState(false);
    const [showProductModal, setShowProductModal] = useState(false);
    const [transactions, setTransactions] = useState([]); // State to store all transactions
    const [selectedMonthYear, setSelectedMonthYear] = useState({
        month: new Date().getMonth() + 1, // Default to current month
        year: new Date().getFullYear() // Default to current year
    });
    const [searchTerm, setSearchTerm] = useState("");
    const [filteredTransactions, setFilteredTransactions] = useState([]);
    const [transactionType, setTransactionType] = useState('');
    const [selectedSection, setSelectedSection] = useState(0);
    const [selectedPurpose, setSelectedPurpose] = useState(0);
    const [selectedProduct, setSelectedProduct] = useState("");
    const [selectedArea, setSelectedArea] = useState(0);
    const [products, setProducts] = useState([]);
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

    useEffect(() => {
        fetchProducts();
        fetchTransactions();
        fetchTransactionsWithProducts();
        createRunningBal();
    }, []);

    useEffect(() => {
        filterTransactionsByMonthYear();
    }, [transactions, selectedMonthYear]);

    const formatProductPayload = (product, transactionDetailsID) => ({
        transactionDetailsID,
        transactionType: product.transactionType || "",
        itemID: product.itemID,
        productName: product.productName,
        areaID: product.areaID, // Ensure areaID is included
        purchasedFromSupp: parseInt(product.purchasedFromSupplier, 10) || 0,
        returnToSupplier: parseInt(product.returnToSupplier, 10) || 0,
        transferFromWH: parseInt(product.transferFromWarehouse, 10) || 0,
        transferToWH: parseInt(product.transferToWarehouse, 10) || 0,
        issuedQty: parseInt(product.issuedQuantity, 10) || 0,
        returnedQty: parseInt(product.returnedQuantity, 10) || 0,
        cost: parseFloat(product.cost) || 0,
    });

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

    const fetchTransactionsWithProducts = async () => {
        try {
            const transactionsResponse = await fetch(API_ENDPOINTS.TRANSACTION_LIST, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${localStorage.getItem("access_token")}`,
                },
            });

            if (!transactionsResponse.ok) {
                throw new Error(`Transactions API Error: ${transactionsResponse.status} ${transactionsResponse.statusText}`);
            }

            const transactions = await transactionsResponse.json();

            const productsResponse = await fetch(API_ENDPOINTS.TRANSACTION_PRODUCTS_ALL, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${localStorage.getItem("access_token")}`,
                },
            });

            if (!productsResponse.ok) {
                throw new Error(`Products API Error: ${productsResponse.status} ${productsResponse.statusText}`);
            }

            const productsText = await productsResponse.text();

            let allProducts;
            try {
                allProducts = JSON.parse(productsText);
            } catch (error) {
                console.error("Invalid JSON from Products API:", productsText);
                throw new Error("Products API did not return valid JSON.");
            }

            const transactionsWithProducts = transactions.map(transaction => ({
                ...transaction,
                products: allProducts.filter(product => product.transactionDetailsID === transaction.transactionDetailsID),
            }));

            setTransactions(transactionsWithProducts);
        } catch (error) {
            console.error("Error fetching transactions and products:", error);
        }
    };

    const filterTransactionsByMonthYear = () => {
        if (!Array.isArray(transactions)) return;

        const filtered = transactions.filter(transaction => {
            const transactionDate = new Date(transaction.date);
            return (
                transactionDate.getMonth() + 1 === selectedMonthYear.month &&
                transactionDate.getFullYear() === selectedMonthYear.year
            );
        });

        setFilteredTransactions(filtered);
    };

    const handleMonthYearChange = (month, year) => {
        setSelectedMonthYear({ month, year });
    };

    const handleSearch = (e) => {
        const term = e.target.value.toLowerCase();
        setSearchTerm(term);

        // Filter transactions based on search term
        const filtered = transactions.filter(transaction => {
            // Search in transaction main fields
            const mainFieldsMatch = [
                transaction.date,
                transaction.week,
                transaction.mris,
                transaction.supplier,
                transaction.requestedBy,
                transaction.sectionName,
                transaction.purposeName
            ].some(field =>
                field && field.toString().toLowerCase().includes(term)
            );

            // Search in transaction products
            const productsMatch = transaction.products && transaction.products.some(product =>
                [
                    product.itemID,
                    product.itemName,
                    product.areaName,
                    product.purchasedFromSupp,
                    product.returnToSupplier,
                    product.transferFromWH,
                    product.transferToWH,
                    product.issuedQty,
                    product.returnedQty,
                    product.consumption
                ].some(field =>
                    field && field.toString().toLowerCase().includes(term)
                )
            );

            return mainFieldsMatch || productsMatch;
        });

        setFilteredTransactions(filtered);
    };

    // Determine which transactions to display
    const displayTransactions = searchTerm ? filteredTransactions : transactions;

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

    const createRunningBal = () => {
        const token = localStorage.getItem("access_token");
        if (!token) {
            console.error("Authorization token is missing.");
            alert("Authorization token is missing. Please log in again.");
            return;
        }
        try {
            return fetch(API_ENDPOINTS.RUNNING_BAL_CREATE, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${token}`,
                },
            });
        } catch (error) {
            console.error("Error adding products:", error);
            alert("Some products could not be added. Please check your data.");
        }
    };

    const handleAddProduct = (e) => {
        e.preventDefault();

        if (!selectedArea) {
            alert("Please select an area.");
            return;
        }

        // Create a new updated product object
        const updatedProduct = {
            ...productData,
            transactionType: transactionType,
            areaID: selectedArea,
        };
        setProductData(updatedProduct);
        setTransactionData((prevData) => ({
            ...prevData,
            products: [...(prevData.products || []), updatedProduct],
        }));

        console.log("Submitting Product:", updatedProduct);

        handleCloseProductModal();
        handleShowTransactionModal();
    };


    const submitProducts = async (transactionDetailsID) => {
        if (!Array.isArray(transactionData.products) || transactionData.products.length === 0) {
            console.warn("No products to submit.");
            return;
        }

        try {
            const token = localStorage.getItem("access_token");
            if (!token) {
                console.error("Authorization token is missing.");
                alert("Authorization token is missing. Please log in again.");
                return;
            }

            const productRequests = transactionData.products.map((product) => {
                const productPayload = formatProductPayload(product, transactionDetailsID);
                console.log("Final Product Payload:", productPayload); // Debugging

                return fetch(API_ENDPOINTS.ADD_TRANSACTION_PRODUCT, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": `Token ${token}`,
                    },
                    body: JSON.stringify(productPayload),

                }).then(async (response) => {
                    if (!response.ok) {
                        console.log("Final Submitted Product Data:", productData);
                        const errorResponse = await response.json();
                        console.error("API Error Response:", errorResponse);
                        throw new Error(`Failed to add product: ${product.productName} - ${JSON.stringify(errorResponse)}`);
                    }
                });
            });

            await Promise.all(productRequests);
            alert("Products have been successfully added!");

        } catch (error) {
            console.error("Error adding products:", error);
            alert("Some products could not be added. Please check your data.");
        }
    };

    const handleSubmitTransaction = async (e) => {
        e.preventDefault();

        const formData = {
            date: transactionData.date,
            week: transactionData.week,
            mris: transactionData.mris,
            supplier: transactionData.supplier,
            requestedBy: transactionData.requestedBy,
            sectionID: selectedSection,
            purposeID: selectedPurpose,
        };

        const token = localStorage.getItem("access_token");

        try {
            const response = await fetch(API_ENDPOINTS.ADD_TRANSACTION, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${token}`,
                },
                body: JSON.stringify(formData),
            });

            const result = await response.json();
            console.log("API Response:", result); // Debugging response

            if (!response.ok) {
                throw new Error(result.detail || "Failed to add transaction");
            }

            console.log("Transaction Details ID:", result.transactionDetailsID); // Debugging

            if (result.transactionDetailsID) {
                await submitProducts(result.transactionDetailsID); // Use correct key
            } else {
                throw new Error("Transaction Details ID is missing in API response.");
            }

            fetchTransactionsWithProducts();// Refresh transaction list
            alert("New Transaction Recorded!");
            setShowTransactionModal(false);
        } catch (error) {
            console.error("Error saving transaction:", error);
            alert("Error saving transaction. Please try again.");
        }
    };

    // Handle edit and delete actions
    const handleEdit = (updatedTransaction) => {
        const updatedTransactions = transactions.map(transaction =>
            transaction.id === updatedTransaction.id ? updatedTransaction : transaction
        );
        setTransactions(updatedTransactions);
    };

    const handleDelete = async (transactionDetailsID) => {
        if (!window.confirm("Are you sure you want to delete this transaction and its associated products?")) {
            return; // Exit if user cancels
        }

        try {
            const response = await fetch(API_ENDPOINTS.DELETE_TRANSACTION(transactionDetailsID), {
                method: "DELETE",
                headers: {
                    "Authorization": `Token ${localStorage.getItem("access_token")}`
                }
            });

            if (!response.ok) {
                throw new Error("Failed to delete transaction");
            }

            // ✅ Update state by filtering out the deleted transaction
            setTransactions((prevTransactions) =>
                prevTransactions.filter(transaction => transaction.transactionDetailsID !== transactionDetailsID)
            );

            alert("Transaction and its products have been successfully deleted!"); // ✅ Success alert
        } catch (error) {
            console.error("Error deleting transaction:", error);
            alert("Error deleting transaction. Please try again.");
        }
    };


    const handleUpdateTransaction = (updatedTransaction) => {
        setTransactions((prevTransactions) =>
            prevTransactions.map((txn) =>
                txn.transactionDetailsID === updatedTransaction.transactionDetailsID ? updatedTransaction : txn
            )
        );
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
                    <MonthYearPicker
                        onMonthYearChange={handleMonthYearChange}
                        initialMonth={selectedMonthYear.month}
                        initialYear={selectedMonthYear.year}
                    />
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input
                        type="search"
                        placeholder="Search transactions"
                        style={{ width: "300px" }}
                        value={searchTerm}
                        onChange={handleSearch}
                    />
                </Col>
            </Row>

            <Row>
                <div style={{ overflowY: "auto", width: "100%", margiin: "0", padding: "0" }}>
                    <Table responsive bordered striped hover id="TtableStyle" className="tableStyle mt-3">
                        <thead className="sticky-header">
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
                            {filteredTransactions.length > 0 ? (
                                filteredTransactions.map((transaction, tIndex) => (
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
                                                    fetchTransactionsWithProducts={fetchTransactionsWithProducts}
                                                    onDelete={handleDelete}
                                                    onUpdate={handleUpdateTransaction}
                                                    transaction={transaction}
                                                    handleTransactionChange={handleTransactionChange}
                                                    handleShowProductModal={handleShowProductModal}
                                                    handleCloseTransactionModalND={handleCloseTransactionModalND}
                                                    handleShowTransactionModal={handleShowTransactionModal}
                                                />
                                            </td>
                                        </tr>
                                        {transaction.products?.length > 0 ? (
                                            transaction.products.map((product, pIndex) => (
                                                <tr key={`${transaction.transactionDetailsID}-${pIndex}`}>
                                                    <td>{product.itemID}</td>
                                                    <td>{product.itemName}</td>
                                                    <td>{product.areaName}</td>
                                                    <td>{product.purchasedFromSupp || 0}</td>
                                                    <td>{product.returnToSupplier || 0}</td>
                                                    <td>{product.transferFromWH || 0}</td>
                                                    <td>{product.transferToWH || 0}</td>
                                                    <td>{product.issuedQty || 0}</td>
                                                    <td>{product.returnedQty || 0}</td>
                                                    <td>{product.consumption || 0}</td>
                                                    <td>{product.cost || 0}</td>
                                                    <td>{product.total || 0}</td>
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
                                    <td colSpan="20" className="text-center">
                                        No transactions found for {new Date(selectedMonthYear.year, selectedMonthYear.month - 1).toLocaleString('default', { month: 'long', year: 'numeric' })}
                                    </td>
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

            <EditTransactionModal
                transactionData={transactionData}
                handleTransactionChange={handleTransactionChange}
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