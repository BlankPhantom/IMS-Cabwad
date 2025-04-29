import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row, Pagination, Modal, Button } from "react-bootstrap";
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
        month: new Date().getMonth(), // Default to current month
        year: new Date().getFullYear(), // Default to current year
    });
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage] = useState(5);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState("");
    const [filteredTransactions, setFilteredTransactions] = useState([]);
    const [transactionType, setTransactionType] = useState("");
    const [isAllMonthSelected, setIsAllMonthSelected] = useState(false);
    const [selectedSection, setSelectedSection] = useState(0);
    const [selectedPurpose, setSelectedPurpose] = useState(0);
    const [selectedProduct, setSelectedProduct] = useState("");
    const [selectedArea, setSelectedArea] = useState(0);
    const [products, setProducts] = useState([]);
    const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false);
    const [transactionToDelete, setTransactionToDelete] = useState(null);
    const [totalPages, setTotalPages] = useState(0);
    const [totalItems, setTotalItems] = useState(0);
    const [transactionData, setTransactionData] = useState({
        date: getCurrentDate(),
        week: getWeekNumber(getCurrentDate()),
        mris: "",
        supplier: "",
        requestedBy: "",
        section: "",
        purpose: "",
        products: [], // Stores added products
    });

    const [productData, setProductData] = useState({
        transactionType: "",
        productName: "",
        itemID: "",
        itemQuantity: "",
        area: "",
        purchasedFromSupplier: "",
        returnToSupplier: "",
        transferFromWarehouse: "",
        transferToWarehouse: "",
        issuedQuantity: "",
        returnedQuantity: "",
        consumption: "",
        cost: "",
        total: "",
    });

    useEffect(() => {
        createRunningBal();
        fetchTransactionsWithProducts(currentPage, itemsPerPage);
    }, [currentPage]);

    useEffect(() => {
        // Reset to page 1 when month/year changes
        setCurrentPage(1);
        fetchTransactionsWithProducts(1, itemsPerPage);
    }, [selectedMonthYear]);

    useEffect(() => {
        if (searchTerm) {
            const filtered = filterTransactions(transactions, searchTerm);
            setFilteredTransactions(filtered);
        } else {
            setFilteredTransactions(transactions);
        }
    }, [searchTerm, transactions]);

    // Update the Running Balance page when the page loads or refreshes
    const createRunningBal = async () => {
        const token = localStorage.getItem("access_token");
        if (!token) {
            console.error("Authorization token is missing.");
            alert("Authorization token is missing. Please log in again.");
            return;
        }

        try {
            setLoading(true);
            const response = await fetch(API_ENDPOINTS.RUNNING_BAL_CREATE, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
            });

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
        } catch (error) {
            console.error("Error adding products:", error);
            setError("Failed to initialize running balance. Please try again later.");
            setLoading(false);
        }
    };

    const formatProductPayload = (product, transactionDetailsID) => ({
        transactionDetailsID,
        transactionType: product.transactionType || "",
        itemID: product.itemID,
        productName: product.productName,
        areaID: product.areaID,
        purchasedFromSupp: parseInt(product.purchasedFromSupplier, 10) || 0,
        returnToSupplier: parseInt(product.returnToSupplier, 10) || 0,
        transferFromWH: parseInt(product.transferFromWarehouse, 10) || 0,
        transferToWH: parseInt(product.transferToWarehouse, 10) || 0,
        issuedQty: parseInt(product.issuedQuantity, 10) || 0,
        returnedQty: parseInt(product.returnedQuantity, 10) || 0,
        cost: parseFloat(product.cost) || 0,
    });

    const fetchTransactionsWithProducts = async (pageNumber = 1, pageSize = itemsPerPage) => {
        setLoading(true);
        try {
            const token = localStorage.getItem("access_token");
            if (!token) {
                console.error("Authorization token is missing.");
                alert("Authorization token is missing. Please log in again.");
                return;
            }
    
            // Add month and year as query parameters if they are selected
            let queryParams = `page=${pageNumber}&page_size=${pageSize}`;
            if (selectedMonthYear.month !== null && !isAllMonthSelected) {
                queryParams += `&month=${selectedMonthYear.month + 1}`; // Add 1 because JS months are 0-based
            }
            if (selectedMonthYear.year) {
                queryParams += `&year=${selectedMonthYear.year}`;
            }
    
            // Fetch paginated transactions
            const transactionsResponse = await fetch(
                `${API_ENDPOINTS.TRANSACTION_LIST}?${queryParams}`,
                {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                }
            );
    
            if (!transactionsResponse.ok) {
                throw new Error(
                    `Transactions API Error: ${transactionsResponse.status} ${transactionsResponse.statusText}`
                );
            }
    
            const transactionsData = await transactionsResponse.json();
    
            // Fetch all products
            const productsResponse = await fetch(API_ENDPOINTS.TRANSACTION_PRODUCTS_ALL, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
            });
    
            if (!productsResponse.ok) {
                throw new Error(
                    `Products API Error: ${productsResponse.status} ${productsResponse.statusText}`
                );
            }
    
            const productsText = await productsResponse.text();
            let allProducts;
            try {
                allProducts = JSON.parse(productsText);
            } catch (error) {
                console.error("Invalid JSON from Products API:", productsText);
                throw new Error("Products API did not return valid JSON.");
            }
    
            // Combine transactions with their products
            const transactionsWithProducts = transactionsData.results.map((transaction) => ({
                ...transaction,
                products: allProducts.filter(
                    (product) =>
                        product.transactionDetailsID === transaction.transactionDetailsID
                ),
            }));
    
            setTransactions(transactionsWithProducts);
            setFilteredTransactions(transactionsWithProducts);
            setTotalItems(transactionsData.count);
            setTotalPages(Math.ceil(transactionsData.count / pageSize));
        } catch (error) {
            console.error("Error fetching transactions and products:", error);
        } finally {
            setLoading(false);
        }
    };

    const filterTransactions = (transactions, term) => {
        if (!Array.isArray(transactions)) return [];
        
        return transactions.filter((transaction) => {
            // Search in transaction main fields
            const mainFieldsMatch = [
                transaction.date,
                transaction.week,
                transaction.mris,
                transaction.supplier,
                transaction.requestedBy,
                transaction.sectionName,
                transaction.purposeName,
            ].some((field) => field && field.toString().toLowerCase().includes(term.toLowerCase()));

            // Search in transaction products
            const productsMatch =
                transaction.products &&
                transaction.products.some((product) =>
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
                        product.consumption,
                    ].some(
                        (field) => field && field.toString().toLowerCase().includes(term.toLowerCase())
                    )
                );

            return mainFieldsMatch || productsMatch;
        });
    };

    const handlePageChange = (pageNumber) => {
        if (pageNumber >= 1 && pageNumber <= totalPages) {
            setCurrentPage(pageNumber);
        }
    };

    const handleMonthYearChange = (month, year) => {
        setLoading(true);
        setIsAllMonthSelected(month === null);
        setSelectedMonthYear({
            month,
            year,
        });
    };

    const handleSearch = (e) => {
        const term = e.target.value.toLowerCase();
        setSearchTerm(term);
        
        // If the search term is empty, re-fetch from the API
        if (!term) {
            fetchTransactionsWithProducts(currentPage, itemsPerPage);
        }
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
            products: [], // Reset products on close
        });
        setSelectedSection("");
        setSelectedPurpose("");
    };

    const handleShowProductModal = () => setShowProductModal(true);

    const handleCloseProductModal = () => {
        setShowProductModal(false);
        setProductData({
            transactionType: "",
            productName: "",
            itemID: "",
            itemQuantity: "",
            area: "",
            purchasedFromSupplier: "",
            returnToSupplier: "",
            transferFromWarehouse: "",
            transferToWarehouse: "",
            issuedQuantity: "",
            returnedQuantity: "",
            consumption: "",
            cost: "",
            total: "",
        });
        setTransactionType("");
        setSelectedProduct("");
        setSelectedArea("");
    };

    const handleCloseTransactionModalND = () => {
        setShowTransactionModal(false);
    };

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
                itemQuantity: "",
                area: "",
                purchasedFromSupplier: "",
                returnToSupplier: "",
                transferFromWarehouse: "",
                transferToWarehouse: "",
                issuedQuantity: "",
                returnedQuantity: "",
                consumption: "",
                cost: "",
                total: "",
            }));
        }
    };

    const handleAddProduct = async (e) => {
        e.preventDefault();

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
        if (
            !Array.isArray(transactionData.products) ||
            transactionData.products.length === 0
        ) {
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
                const productPayload = formatProductPayload(
                    product,
                    transactionDetailsID
                );
                console.log("Final Product Payload:", productPayload); // Debugging

                return fetch(API_ENDPOINTS.ADD_TRANSACTION_PRODUCT, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                    body: JSON.stringify(productPayload),
                }).then(async (response) => {
                    if (!response.ok) {
                        console.log("Final Submitted Product Data:", productData);
                        const errorResponse = await response.json();
                        console.error("API Error Response:", errorResponse);
                        throw new Error(
                            `Failed to add product: ${product.productName} - ${JSON.stringify(
                                errorResponse
                            )}`
                        );
                    }
                });
            });

            await Promise.all(productRequests);
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
                    Authorization: `Token ${token}`,
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

            fetchTransactionsWithProducts(); // Refresh transaction list
            setShowTransactionModal(false);
            handleCloseTransactionModal();
            window.location.reload();
        } catch (error) {
            console.error("Error saving transaction:", error);
            alert("Error saving transaction. Please try again.");
        }
    };

    // Handle edit and delete actions
    const handleEdit = (updatedTransaction) => {
        const updatedTransactions = transactions.map((transaction) =>
            transaction.id === updatedTransaction.id
                ? updatedTransaction
                : transaction
        );
        setTransactions(updatedTransactions);
    };

    const confirmDelete = (transactionDetailsID) => {
        setTransactionToDelete(transactionDetailsID);
        setShowDeleteConfirmation(true);
    };

    const handleDelete = async () => {
        try {
            const response = await fetch(
                API_ENDPOINTS.DELETE_TRANSACTION(transactionToDelete),
                {
                    method: "DELETE",
                    headers: {
                        Authorization: `Token ${localStorage.getItem("access_token")}`,
                    },
                }
            );

            if (!response.ok) {
                throw new Error("Failed to delete transaction");
            }

            // Update state by filtering out the deleted transaction
            setTransactions((prevTransactions) =>
                prevTransactions.filter(
                    (transaction) =>
                        transaction.transactionDetailsID !== transactionToDelete
                )
            );

            // Close the modal
            setShowDeleteConfirmation(false);
            fetchTransactionsWithProducts(currentPage, itemsPerPage);
        } catch (error) {
            console.error("Error deleting transaction:", error);
            setShowDeleteConfirmation(false);
        }
    };

    const handleUpdateTransaction = (updatedTransaction) => {
        setTransactions((prevTransactions) =>
            prevTransactions.map((txn) =>
                txn.transactionDetailsID === updatedTransaction.transactionDetailsID
                    ? updatedTransaction
                    : txn
            )
        );
    };

    const formatCurrency = (value) => {
        return `₱${parseFloat(value).toLocaleString("en-PH", {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2,
        })}`;
    };

    // Generate pagination items
    const generatePaginationItems = () => {
        const items = [];
        const maxVisiblePages = 5;
        
        // Always add first page
        items.push(
            <Pagination.Item 
                key={1} 
                active={currentPage === 1} 
                onClick={() => handlePageChange(1)}
            >
                1
            </Pagination.Item>
        );
        
        // Add ellipsis if needed
        if (currentPage > maxVisiblePages - 2) {
            items.push(<Pagination.Ellipsis key="ellipsis-start" />);
        }
        
        // Add pages around current page
        const startPage = Math.max(2, currentPage - 1);
        const endPage = Math.min(totalPages - 1, currentPage + 1);
        
        for (let i = startPage; i <= endPage; i++) {
            if (i > 1 && i < totalPages) {
                items.push(
                    <Pagination.Item 
                        key={i} 
                        active={currentPage === i} 
                        onClick={() => handlePageChange(i)}
                    >
                        {i}
                    </Pagination.Item>
                );
            }
        }
        
        // Add ellipsis if needed
        if (currentPage < totalPages - 2) {
            items.push(<Pagination.Ellipsis key="ellipsis-end" />);
        }
        
        // Always add last page if there's more than one page
        if (totalPages > 1) {
            items.push(
                <Pagination.Item 
                    key={totalPages} 
                    active={currentPage === totalPages} 
                    onClick={() => handlePageChange(totalPages)}
                >
                    {totalPages}
                </Pagination.Item>
            );
        }
        
        return items;
    };

    return (
        <Container
            style={{ width: "100%" }}
            fluid
            className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 className="mt-5" style={{ fontWeight: "650" }}>
                        Transactions
                    </h2>
                </Col>
            </Row>

            <Row>

            </Row>

            <Row className="mt-3 d-flex align-items-center justify-content-between">
                <Col>
                    <MonthYearPicker
                        onMonthYearChange={handleMonthYearChange}
                        initialMonth={selectedMonthYear.month}
                        initialYear={selectedMonthYear.year}
                        allowAllMonths={true}
                    />
                </Col>
                <Col className="d-flex justify-content-end">
                    <input
                        type="search"
                        className="form-control"
                        placeholder="Search"
                        style={{ width: "300px" }}
                        value={searchTerm}
                        onChange={handleSearch}
                    />
                </Col>
            </Row>

            <Row>
                <div style={{ overflowY: "auto", width: "100%", margin: "0", padding: "0" }}>
                    <Table responsive bordered striped hover id="TtableStyle" className="tableStyle mt-3">
                        <thead className="sticky-header">
                            <tr>
                                <th>Date</th>
                                <th>Week</th>
                                <th>MRIS/DR</th>
                                <th>Supplier</th>
                                <th>Requested <br /> By</th>
                                <th>Section</th>
                                <th>Purpose</th>
                                <th>Item ID</th>
                                <th>Product Name</th>
                                <th>Area</th>
                                <th>Purchased <br /> From <br /> Supplier</th>
                                <th>Return <br /> to <br /> Supplier</th>
                                <th>Transfer <br /> from <br /> Other <br /> Warehouse</th>
                                <th>Transfer to <br /> Other <br /> Warehouse</th>
                                <th>Issued <br /> Qty.</th>
                                <th>Returned <br /> Qty.</th>
                                <th>Consumption</th>
                                <th>Cost</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            {loading ? (
                                <tr>
                                    <td colSpan="20" className="text-center">
                                        <div className="d-flex justify-content-center align-items-center">
                                            <span>Loading transactions...</span>
                                        </div>
                                    </td>
                                </tr>
                            ) : filteredTransactions.length > 0 ? (
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
                                                    onDelete={confirmDelete}
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
                                                    <td>{formatCurrency(product.cost)}</td>
                                                    <td>{formatCurrency(product.total || 0)}</td>
                                                </tr>
                                            ))
                                        ) : (
                                            <tr>
                                                <td colSpan="20" className="text-center text-muted">No products added</td>
                                            </tr>
                                        )}
                                    </React.Fragment>
                                ))
                            ) : (
                                <tr>
                                    <td colSpan="20" className="text-center">
                                        {isAllMonthSelected ?
                                            `No transactions found for ${selectedMonthYear.year}` :
                                            `No transactions found for ${new Date(selectedMonthYear.year, selectedMonthYear.month).toLocaleString('default', { month: 'long', year: 'numeric' })}`
                                        }
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </Table>
                </div>
            </Row>

            {/* Pagination - only show when not loading and has data */}
            {!loading && totalPages > 0 && (
                <Row>
                    <Col className="d-flex justify-content-center mt-3">
                        <Pagination>
                            <Pagination.First
                                onClick={() => handlePageChange(1)}
                                disabled={currentPage === 1}
                            />
                            <Pagination.Prev
                                onClick={() => handlePageChange(currentPage - 1)}
                                disabled={currentPage === 1}
                            />
                            
                            {generatePaginationItems()}
                            
                            <Pagination.Next
                                onClick={() => handlePageChange(currentPage + 1)}
                                disabled={currentPage === totalPages}
                            />
                            <Pagination.Last
                                onClick={() => handlePageChange(totalPages)}
                                disabled={currentPage === totalPages}
                            />
                        </Pagination>
                    </Col>
                </Row>
            )}

            <BtnAddTransaction
                handleShowTransactionModal={handleShowTransactionModal}
            />

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

            <Modal show={showDeleteConfirmation} onHide={() => setShowDeleteConfirmation(false)} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Confirm Delete</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    Are you sure you want to delete this transaction and its associated products?
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShowDeleteConfirmation(false)}>
                        Cancel
                    </Button>
                    <Button variant="danger" onClick={handleDelete}>
                        Delete
                    </Button>
                </Modal.Footer>
            </Modal>

            <EditTransactionModal
                transactionData={transactionData}
                handleTransactionChange={handleTransactionChange}
                onSuccess={fetchTransactionsWithProducts}
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
    const week = Math.ceil((days + 1) / 7);

    return Math.min(week, 4);
}
