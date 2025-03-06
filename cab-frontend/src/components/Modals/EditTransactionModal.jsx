import React, { useState, useEffect } from 'react';
import { Modal, Form, Button, Row, Col } from 'react-bootstrap';
import { API_ENDPOINTS } from "../../config";
import { faPenToSquare, faTrashAlt } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

const EditTransactionModal = ({
    show,
    handleClose,
    transactionData,
    handleChange,
    setEditTransactionData,
    handleShow,
}) => {
    const [editProductData, setEditProductData] = useState({});
    const [showEditProductModal, setShowEditProductModal] = useState(false);
    const [editProductIndex, setEditProductIndex] = useState(null);
    const [setEditSelectedArea, setSelectedEditArea] = useState('');
    const [sections, setSections] = useState([]);
    const [showProductModal, setShowProductModal] = useState(false);
    const [purpose, setPurpose] = useState([]);
    const [area, setArea] = useState([]);
    const [products, setProducts] = useState([]);
    const [localProducts, setLocalProducts] = useState([]);
    const [transactionProducts, setTransactionProducts] = useState([]);
    const [transactionType, setTransactionType] = useState('');
    const [selectedProduct, setSelectedProduct] = useState("");
    const [selectedSection, setSelectedSection] = useState(0);
    const [selectedPurpose, setSelectedPurpose] = useState(0);
    const [selectedArea, setSelectedArea] = useState(0);
    const [transactions, setTransactions] = useState([]);
    const [filteredProducts, setFilteredProducts] = useState([]);
    const [selectedExistingProduct, setSelectedExistingProduct] = useState(null);
    const [showEditExistingProductModal, setShowEditExistingProductModal] = useState(false);
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

    // ✅ Fetch sections & purpose on mount
    useEffect(() => {
        fetchTransactionsWithProducts();
        fetchTransactions();
        fetchSections();
        fetchPurpose();
        fetchArea();
        fetchProducts();
    }, []);

    // ✅ Fetch products for the transaction when modal opens
    useEffect(() => {
        if (transactionData?.transactionDetailsID) {
            fetchProductsForTransaction(transactionData.transactionDetailsID);
            setSelectedSection(transactionData.sectionID || "");
            setSelectedPurpose(transactionData.purposeID || "");
        }
    }, [transactionData]);

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

    const fetchSections = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.SECTION_LIST);
            const data = await response.json();
            setSections(data);
        } catch (error) {
            console.error("Error fetching sections:", error);
        }
    };

    const fetchPurpose = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.PURPOSE_LIST);
            const data = await response.json();
            setPurpose(data);
        } catch (error) {
            console.error("Error fetching purpose:", error);
        }
    };

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

    const fetchProductsForTransaction = async (transactionDetailsID) => {
        try {
            const response = await fetch(API_ENDPOINTS.TRANSACTION_PRODUCTS_ALL);
            const data = await response.json();

            const filteredProducts = data.filter(product =>
                product.transactionDetailsID === transactionDetailsID
            );

            // Add transaction type to each product
            const productsWithType = filteredProducts.map(product => ({
                ...product,
                transactionType: determineTransactionType(product)
            }));

            setTransactionProducts(productsWithType);
        } catch (error) {
            console.error("Error fetching transaction products:", error);
        }
    };

    const fetchTransactionsWithProducts = async () => {
        try {
            const transactionsResponse = await fetch(API_ENDPOINTS.TRANSACTION_LIST, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${localStorage.getItem("access_token")}`, // ✅ Ensure token is included
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

            // ✅ **Check if Response is Valid JSON**
            let allProducts;
            try {
                allProducts = JSON.parse(productsText);
            } catch (error) {
                console.error("Invalid JSON from Products API:", productsText);
                throw new Error("Products API did not return valid JSON.");
            }

            // ✅ **Filter products correctly**
            const transactionsWithProducts = transactions.map(transaction => ({
                ...transaction,
                products: allProducts.filter(product => product.transactionDetailsID === transaction.transactionDetailsID),
            }));

            setTransactions(transactionsWithProducts);
        } catch (error) {
            console.error("Error fetching transactions and products:", error);
        }
    };

    const handleShowProductModal = () => {
        setShowProductModal(true);
        setTransactionType(''); // Reset transaction type
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
        setSelectedProduct('');
        setSelectedArea('');
    };

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

    const handleCloseEditTransactionModal = () => {
        setLocalProducts([]);  // ✅ Clear only when canceling the entire transaction
        handleClose();         // ✅ Close the transaction modal
    };

    const handleEditSectionChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedSection(selectedId);
        setEditTransactionData((prevData) => ({
            ...prevData,
            sectionID: selectedId,
        }));
    };

    const handleEditPurposeChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedPurpose(selectedId);
        setEditTransactionData((prevData) => ({
            ...prevData,
            purposeID: selectedId,
        }));
    };

    const handleAreaChange = (event) => {
        console.log("Selected Area:", event.target.value);
        setSelectedArea(event.target.value);
    };

    const handleProductChange = (e) => {
        setProductData({ ...productData, [e.target.name]: e.target.value });
    };

    const handleEditAreaChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedEditArea(selectedId);

        setEditProductData((prevData) => ({
            ...prevData,
            areaID: selectedId, // ✅ Update areaID directly
        }));
    };


    const handleProductNameChange = (e) => {
        const { value } = e.target;
        setProductData(prevData => ({
            ...prevData,
            productName: value
        }));

        if (value) {
            const filtered = products.filter(product => product.itemName.toLowerCase().includes(value.toLowerCase()));
            setFilteredProducts(filtered);
        } else {
            setFilteredProducts([]);
        }
    };

    const handleEditProductNameChange = (e) => {
        const { value } = e.target;

        setEditProductData((prevData) => ({
            ...prevData,
            productName: value,
        }));

        if (value) {
            const filtered = products.filter(product =>
                product.itemName.toLowerCase().includes(value.toLowerCase())
            );
            setFilteredProducts(filtered);
        } else {
            setFilteredProducts([]);
        }
    };

    const handleTransactionTypeChange = (e) => {
        const { value } = e.target;
        setTransactionType(value); // Always update state

        setEditProductData((prevData) => ({
            ...prevData,
            transactionType: value,
            purchasedFromSupplier: "", // Clear fields
            returnToSupplier: "",
            issuedQuantity: "",
            returnedQuantity: "",
        }));
    };

    const handleProductSelect = (product) => {
        setSelectedProduct(product.itemID);
        setProductData({
            itemID: product.itemID,
            productName: product.itemName,
            cost: product.unitCost
        });
        setFilteredProducts([]);
    };

    const handleEditProductSelect = (product) => {
        setSelectedProduct(product.itemID);
        setEditProductData((prevData) => ({
            ...prevData,
            itemID: product.itemID,
            productName: product.itemName,
            cost: product.unitCost,
        }));
        setFilteredProducts([]); // Clear the filtered list after selection
    };

    const handleEditProductChange = (e) => {
        const { name, value } = e.target;
        setEditProductData((prevData) => ({ ...prevData, [name]: value }));
    };

    const handleAddProductSubmit = (e) => {
        e.preventDefault();

        if (!selectedArea) {
            alert("Please select an area.");
            return;
        }

        // ✅ Create a new product object with proper data types
        const newProduct = {
            ...productData,
             transactionType: determineTransactionType(productData),
            areaID: parseInt(selectedArea, 10) || 0, // ✅ Convert to number
            purchasedFromSupplier: parseInt(productData.purchasedFromSupplier, 10) || 0, // ✅ Convert to number
            returnToSupplier: parseInt(productData.returnToSupplier, 10) || 0,
            transferFromWarehouse: parseInt(productData.transferFromWarehouse, 10) || 0,
            transferToWarehouse: parseInt(productData.transferToWarehouse, 10) || 0,
            issuedQuantity: parseInt(productData.issuedQuantity, 10) || 0,
            returnedQuantity: parseInt(productData.returnedQuantity, 10) || 0,
        };

        // ✅ Add the new product to `localProducts` instead of submitting immediately
        setLocalProducts((prevProducts) => [...prevProducts, newProduct]);

        console.log("New Product Added Locally:", newProduct);

        // ✅ Close modals after adding the product
        handleCloseProductModal();
        handleShow();
    };


    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const token = localStorage.getItem("access_token");

            // ✅ Step 1: Update the transaction details
            const transactionResponse = await fetch(API_ENDPOINTS.UPDATE_TRANSACTION(transactionData.transactionDetailsID), {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
                body: JSON.stringify(transactionData),
            });

            if (!transactionResponse.ok) throw new Error("Failed to update transaction");

            console.log("✅ Transaction updated successfully!");

            // ✅ Step 2: Submit all newly added products (only if localProducts is not empty)
            if (localProducts.length > 0) {
                console.log("🛒 Adding new products:", localProducts);

                const productRequests = localProducts.map(productData => {
                    const productPayload = {
                        transactionDetailsID: transactionData.transactionDetailsID,
                        transactionType: productData.transactionType || "",
                        itemID: productData.itemID,
                        productName: productData.productName,
                        areaID: productData.areaID,
                        purchasedFromSupp: parseInt(productData.purchasedFromSupplier, 10) || 0,
                        returnToSupplier: parseInt(productData.returnToSupplier, 10) || 0,
                        transferFromWH: parseInt(productData.transferFromWarehouse, 10) || 0,
                        transferToWH: parseInt(productData.transferToWarehouse, 10) || 0,
                        issuedQty: parseInt(productData.issuedQuantity, 10) || 0,
                        returnedQty: parseInt(productData.returnedQuantity, 10) || 0,
                        cost: parseFloat(productData.cost) || 0,
                    };

                    return fetch(API_ENDPOINTS.ADD_TRANSACTION_PRODUCT, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            Authorization: `Token ${token}`,
                        },
                        body: JSON.stringify(productPayload),
                    });
                });

                // ✅ Await all product requests
                const results = await Promise.allSettled(productRequests);

                results.forEach((result, index) => {
                    if (result.status === "rejected") {
                        console.error(`❌ Failed to add product ${localProducts[index].productName}:`, result.reason);
                    } else {
                        console.log(`✅ Product ${localProducts[index].productName} added successfully!`);
                    }
                });
            }

            // ✅ Step 3: Refresh transactions **before closing the modal**
            setTransactions([]);  // ✅ Clear transactions before fetching new ones
            alert("Transaction and products have been successfully updated!");

            setLocalProducts([]); // ✅ Clear local products before closing modal
            handleClose(); // ✅ Close modal **only after table refreshes**
            fetchTransactionsWithProducts(); // ✅ Ensure data is fully refreshed
        } catch (error) {
            console.error("❌ Error saving transaction:", error);
            alert("Failed to save changes. Please try again.");
        }
    };
    const handleEditProduct = (index) => {
        const product = localProducts[index]; // Get local product data
        if (!product) {
            console.error("Product not found at index:", index);
            return;
        }

        setEditProductIndex(index);
        setEditProductData({
            ...product,
            areaID: product.areaID || "", // Ensure areaID is populated
        });
        setSelectedEditArea(product.areaID || ""); // ✅ Store selected area correctly
        setTransactionType(product.transactionType || ""); // Ensure transaction type is set
        setShowEditProductModal(true);
    };


    const handleDeleteProduct = (index) => {
        setLocalProducts((prevProducts) => prevProducts.filter((_, i) => i !== index));
    };

    const handleSaveProduct = (e) => {
        e.preventDefault();

        setLocalProducts((prevProducts) => {
            const updatedProducts = [...prevProducts];

            if (editProductIndex !== null) {
                updatedProducts[editProductIndex] = editProductData; // ✅ Edit existing product
            } else {
                updatedProducts.push({ ...productData }); // ✅ Add new product
            }

            return updatedProducts;
        });

        setEditProductIndex(null); // ✅ Reset index
        setEditProductData({}); // ✅ Clear edit state
        handleCloseProductModal(); // ✅ Close the modal after saving
    };

    const handleEditExistingProduct = (product) => {
        setSelectedExistingProduct(product);
        setEditProductData({
            transactionProductID: product.transactionProductID,
            itemID: product.itemID,
            productName: product.itemName,
            transactionType: product.transactionType,
            areaID: product.areaID,
            purchasedFromSupplier: product.purchasedFromSupp,
            returnToSupplier: product.returnToSupplier,
            transferFromWarehouse: product.transferFromWH,
            transferToWarehouse: product.transferToWH,
            issuedQuantity: product.issuedQty,
            returnedQuantity: product.returnedQty,
            cost: product.cost
        });
        setTransactionType(product.transactionType);
        setShowEditExistingProductModal(true);
        handleClose(); // Close the main edit transaction modal
    };

    const handleSaveExistingProduct = async (e) => {
        e.preventDefault();
        try {
            const token = localStorage.getItem("access_token");

            // Prepare payload for updating the existing product
            const productPayload = {
                transactionType: editProductData.transactionType,
                itemID: editProductData.itemID,
                areaID: editProductData.areaID,
                purchasedFromSupp: parseInt(editProductData.purchasedFromSupplier, 10) || 0,
                returnToSupplier: parseInt(editProductData.returnToSupplier, 10) || 0,
                transferFromWH: parseInt(editProductData.transferFromWarehouse, 10) || 0,
                transferToWH: parseInt(editProductData.transferToWarehouse, 10) || 0,
                issuedQty: parseInt(editProductData.issuedQuantity, 10) || 0,
                returnedQty: parseInt(editProductData.returnedQuantity, 10) || 0,
                cost: parseFloat(editProductData.cost) || 0,
            };

            // Send PUT request to update the existing product
            const response = await fetch(
                API_ENDPOINTS.UPDATE_TRANSACTION_PRODUCT(
                    transactionData.transactionDetailsID,
                    selectedExistingProduct.transactionProductID
                ),
                {
                    method: "PUT",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                    body: JSON.stringify(productPayload),
                }
            );

            if (!response.ok) {
                const errorText = await response.text();
                throw new Error(`Failed to update product: ${errorText}`);
            }

            // Refresh transaction products after successful update
            await fetchProductsForTransaction(transactionData.transactionDetailsID);

            alert("Product updated successfully!");
            setShowEditExistingProductModal(false);
            handleShow(); // Reopen the main edit transaction modal
        } catch (error) {
            console.error("Error updating product:", error);
            alert(`Failed to update product: ${error.message}`);
        }
    };

    const handleDeleteExistingProduct = async (product) => {
        const confirmDelete = window.confirm("Are you sure you want to delete this product?");

        if (!confirmDelete) return;

        try {
            const token = localStorage.getItem("access_token");

            const response = await fetch(
                API_ENDPOINTS.DELETE_TRANSACTION_PRODUCT(
                    transactionData.transactionDetailsID,
                    product.transactionProductID
                ),
                {
                    method: "DELETE",
                    headers: {
                        "Authorization": `Token ${token}`,
                    },
                }
            );

            if (!response.ok) {
                const errorText = await response.text();
                throw new Error(`Failed to delete product: ${errorText}`);
            }

            // Refresh transaction products after successful deletion
            await fetchProductsForTransaction(transactionData.transactionDetailsID);

            alert("Product deleted successfully!");
        } catch (error) {
            console.error("Error deleting product:", error);
            alert(`Failed to delete product: ${error.message}`);
        }
    };

    const determineTransactionType = (product) => {
        // Check conditions in order of specificity
        if (product.purchasedFromSupp > 0) {
            return 'PurchaseSupply';
        }

        if (product.returnToSupplier > 0) {
            return 'ReturnSupply';
        }

        if (product.issuedQty > 0 || product.returnedQty > 0) {
            return 'Issue/Return';
        }

        if (product.transferFromWH > 0 || product.transferToWH > 0) {
            return 'Warehouse Transfer';
        }

        return 'Unknown'; // Fallback if no type can be determined
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
                            <Form.Control type="text" name="requestedBy" value={transactionData.requestedBy} onChange={handleChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Section</Form.Label>
                            <Form.Select name="section" value={selectedSection} onChange={handleEditSectionChange} required>
                                <option value="">Select Section</option>
                                {sections.map((section) => (
                                    <option key={section.sectionID} value={section.sectionID}>
                                        {section.sectionName}
                                    </option>
                                ))}
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Purpose</Form.Label>
                            <Form.Select name="purpose" value={selectedPurpose} onChange={handleEditPurposeChange} required>
                                <option value="">Select Purpose</option>
                                {purpose.map((purpose) => (
                                    <option key={purpose.purposeID} value={purpose.purposeID}>
                                        {purpose.purposeName}
                                    </option>
                                ))}
                            </Form.Select>
                        </Form.Group>

                        <div className="d-flex justify-content-end">
                            <Button onClick={() => { handleShowProductModal(); handleClose() }} variant="primary">
                                Add Product
                            </Button>
                        </div>

                        {/* ✅ Display Products for the Transaction */}
                        <h5>Products List</h5>
                        {transactionProducts.length > 0 ? (
                            <ul className="mt-3">
                                {transactionProducts.map((product) => (
                                    <li key={product.transactionProductID}>
                                        {product.itemName} {/* ✅ Display product name instead of itemID */}
                                        <span
                                            style={{ color: "#ffcc00", marginRight: '5px', marginLeft: '5px', cursor: "pointer" }}
                                            onClick={() => handleEditExistingProduct(product)}
                                        >
                                            <FontAwesomeIcon icon={faPenToSquare} />
                                        </span>
                                        <span
                                            style={{ color: "red", cursor: "pointer" }}
                                            onClick={() => handleDeleteExistingProduct(product)}
                                        >
                                            <FontAwesomeIcon icon={faTrashAlt} />
                                        </span>
                                    </li>
                                ))}
                            </ul>
                        ) : (
                            <p className="text-muted">No products added to this transaction</p>
                        )}
                        <h5>New Product Addtions</h5>
                        {localProducts.map((product, index) => (
                            <li key={index}>{product.productName}
                                <span
                                    style={{ color: "#ffcc00", marginRight: '5px', marginLeft: '5px', cursor: "pointer" }}
                                    onClick={() => { handleEditProduct(index); handleClose() }}
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
                        <div className="d-flex justify-content-end gap-2 mt-3">
                            <Button variant="danger" onClick={() => { handleCloseEditTransactionModal() }}>
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
            <Modal show={showProductModal} centered>
                <Modal.Header>
                    <Modal.Title>Add New Product</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleAddProductSubmit}>
                        <Form.Group className="mb-3">
                            <Form.Label>Transaction Type</Form.Label>
                            <Form.Select name="transactionType" value={transactionType} onChange={handleTransactionTypeChange} required>
                                <option value="">Select Transaction Type</option>
                                <option value="PurchaseSupply">Purchased from Supplier</option>
                                <option value="ReturnSupply">Return to Supplier</option>
                                <option value="Issue/Return">Issue/Return</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control
                                type="text"
                                name="productName"
                                value={productData.productName}
                                onChange={handleProductNameChange}
                                required
                            />
                            {filteredProducts.length > 0 && (
                                <div className="dropdown-menu show">
                                    {filteredProducts.map((product) => (
                                        <div
                                            key={product.itemID}
                                            className="dropdown-item"
                                            onClick={() => handleProductSelect(product)}
                                        >
                                            {product.itemName} ({product.itemID})
                                        </div>
                                    ))}
                                </div>
                            )}
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="text" name="itemID" value={productData.itemID} readOnly />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Area</Form.Label>
                            <Form.Select name="area" value={selectedArea} onChange={handleAreaChange}>
                                <option value="">Select Area</option>
                                {area.map((area) => (
                                    <option key={area.areaID} value={area.areaID}>
                                        {area.areaName}
                                    </option>
                                ))}
                            </Form.Select>
                        </Form.Group>


                        {transactionType === 'PurchaseSupply' && (
                            <>
                                <Form.Group className="mb-3">
                                    <Form.Label>Purchased from Supplier</Form.Label>
                                    <Form.Control type="number" name="purchasedFromSupplier" value={productData.purchasedFromSupplier} onChange={handleProductChange} min="0" />
                                </Form.Group>
                            </>
                        )}

                        {transactionType === 'ReturnSupply' && (
                            <Form.Group className="mb-3">
                                <Form.Label>Return to Supplier</Form.Label>
                                <Form.Control type="number" name="returnToSupplier" value={productData.returnToSupplier} onChange={handleProductChange} min="0" />
                            </Form.Group>
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
                            <Form.Label>Transfer from other Warehouse</Form.Label>
                            <Form.Control type="number" name="transferFromWarehouse" value={productData.transferFromWarehouse} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Transfer to other Warehouse</Form.Label>
                            <Form.Control type="number" name="transferToWarehouse" value={productData.transferToWarehouse} onChange={handleProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Cost</Form.Label>
                            <Form.Control type="number" name="cost" value={productData.cost} onChange={handleProductChange} required min="0" />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { handleCloseProductModal(); handleShow(); }}>
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
            <Modal show={showEditProductModal} onHide={() => { setShowEditProductModal(false); handleShow(); }} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Edit Product</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSaveProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Transaction Type</Form.Label>
                            <Form.Select name="transactionType" value={editProductData.transactionType} onChange={handleTransactionTypeChange} required>
                                <option value="">Select Transaction Type</option>
                                <option value="PurchaseSupply">Purchased from Supplier</option>
                                <option value="ReturnSupply">Return to Supplier</option>
                                <option value="Issue/Return">Issue/Return</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control
                                type="text"
                                name="productName"
                                value={editProductData.productName}
                                onChange={handleEditProductNameChange}
                                required
                            />
                            {filteredProducts.length > 0 && (
                                <div className="dropdown-menu show">
                                    {filteredProducts.map((product) => (
                                        <div
                                            key={product.itemID}
                                            className="dropdown-item"
                                            onClick={() => handleEditProductSelect(product)}
                                        >
                                            {product.itemName} ({product.itemID})
                                        </div>
                                    ))}
                                </div>
                            )}
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="text" name="itemID" value={editProductData.itemID} required onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Area</Form.Label>
                            <Form.Select name="areaID" value={editProductData.areaID || ""} onChange={handleEditAreaChange}>
                                {area.map((area) => (
                                    <option key={area.areaID} value={area.areaID}>
                                        {area.areaName}
                                    </option>
                                ))}
                            </Form.Select>
                        </Form.Group>

                        {transactionType === 'PurchaseSupply' && (
                            <>
                                <Form.Group className="mb-3">
                                    <Form.Label>Purchased from Supplier</Form.Label>
                                    <Form.Control type="number" name="purchasedFromSupplier" value={editProductData.purchasedFromSupplier} onChange={handleEditProductChange} min="0" />
                                </Form.Group>
                            </>
                        )}

                        {transactionType === 'ReturnSupply' && (
                            <Form.Group className="mb-3">
                                <Form.Label>Return to Supplier</Form.Label>
                                <Form.Control type="number" name="returnToSupplier" value={editProductData.returnToSupplier} onChange={handleEditProductChange} min="0" />
                            </Form.Group>
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
                            <Form.Control type="number" name="cost" value={editProductData.cost} onChange={handleEditProductChange} min="0" />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { setShowEditProductModal(false); handleShow(); }}>
                                Cancel
                            </Button>
                            <Button type="submit" onClick={() => { handleShow(); setShowEditProductModal(false); }} variant="primary">
                                Save Changes
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>

            <Modal show={showEditExistingProductModal} onHide={() => { setShowEditExistingProductModal(false); handleShow(); }} centered>
                <Modal.Header closeButton>
                    <Modal.Title>Edit Existing Product</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={handleSaveExistingProduct}>
                        <Form.Group className="mb-3">
                            <Form.Label>Transaction Type</Form.Label>
                            <Form.Select name="transactionType" value={editProductData.transactionType} onChange={handleTransactionTypeChange} required>
                                <option value="">Select Transaction Type</option>
                                <option value="PurchaseSupply">Purchased from Supplier</option>
                                <option value="ReturnSupply">Return to Supplier</option>
                                <option value="Issue/Return">Issue/Return</option>
                            </Form.Select>
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Product Name</Form.Label>
                            <Form.Control
                                type="text"
                                name="productName"
                                value={editProductData.productName}
                                onChange={handleEditProductNameChange}
                                required
                            />
                            {filteredProducts.length > 0 && (
                                <div className="dropdown-menu show">
                                    {filteredProducts.map((product) => (
                                        <div
                                            key={product.itemID}
                                            className="dropdown-item"
                                            onClick={() => handleEditProductSelect(product)}
                                        >
                                            {product.itemName} ({product.itemID})
                                        </div>
                                    ))}
                                </div>
                            )}
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Item ID</Form.Label>
                            <Form.Control type="text" name="itemID" value={editProductData.itemID} required onChange={handleEditProductChange} />
                        </Form.Group>

                        <Form.Group className="mb-3">
                            <Form.Label>Area</Form.Label>
                            <Form.Select name="areaID" value={editProductData.areaID || ""} onChange={handleEditAreaChange}>
                                {area.map((area) => (
                                    <option key={area.areaID} value={area.areaID}>
                                        {area.areaName}
                                    </option>
                                ))}
                            </Form.Select>
                        </Form.Group>

                        {transactionType === 'PurchaseSupply' && (
                            <>
                                <Form.Group className="mb-3">
                                    <Form.Label>Purchased from Supplier</Form.Label>
                                    <Form.Control type="number" name="purchasedFromSupplier" value={editProductData.purchasedFromSupplier} onChange={handleEditProductChange} min="0" />
                                </Form.Group>
                            </>
                        )}

                        {transactionType === 'ReturnSupply' && (
                            <Form.Group className="mb-3">
                                <Form.Label>Return to Supplier</Form.Label>
                                <Form.Control type="number" name="returnToSupplier" value={editProductData.returnToSupplier} onChange={handleEditProductChange} min="0" />
                            </Form.Group>
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
                            <Form.Control type="number" name="cost" value={editProductData.cost} onChange={handleEditProductChange} min="0" />
                        </Form.Group>

                        <div className="d-flex justify-content-end gap-2">
                            <Button variant="danger" onClick={() => { setShowEditExistingProductModal(false); handleShow(); }}>
                                Cancel
                            </Button>
                            <Button type="submit" onClick={() => { handleShow(); setShowEditExistingProductModal(false); }} variant="primary">
                                Save Changes
                            </Button>
                        </div>
                    </Form>
                </Modal.Body>
            </Modal>
        </>
    );
};

export default EditTransactionModal;
