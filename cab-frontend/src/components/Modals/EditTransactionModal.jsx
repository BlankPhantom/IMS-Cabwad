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
    const [sections, setSections] = useState([]);
    const [showProductModal, setShowProductModal] = useState(false);
    const [purpose, setPurpose] = useState([]);
    const [area, setArea] = useState([]);
    const [products, setProducts] = useState([]);
    const [localProducts, setLocalProducts] = useState([]);
    const [editProductData, setEditProductData] = useState({});
    const [transactionProducts, setTransactionProducts] = useState([]);
    const [transactionType, setTransactionType] = useState('');
    const [selectedProduct, setSelectedProduct] = useState("");
    const [selectedSection, setSelectedSection] = useState(0);
    const [selectedPurpose, setSelectedPurpose] = useState(0);
    const [selectedArea, setSelectedArea] = useState(0);
    const [transactions, setTransactions] = useState([]);
    const [filteredProducts, setFilteredProducts] = useState([]);

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
            const response = await fetch(API_ENDPOINTS.TRANSACTION_PRODUCTS_ALL); // Fetch all transaction products
            const data = await response.json();

            // ✅ **Filter products based on transactionDetailsID**
            const filteredProducts = data.filter(product => product.transactionDetailsID === transactionDetailsID);

            setTransactionProducts(filteredProducts); // ✅ Store only matching products
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

            // ✅ Ensure new transactions are created
            const updatedTransactions = transactions.map(transaction => ({
                ...transaction,
                products: allProducts.filter(product => product.transactionDetailsID === transaction.transactionDetailsID),
            }));

            // ✅ Update state with a new reference
            setTransactions([...updatedTransactions]);
        } catch (error) {
            console.error("Error fetching transactions and products:", error);
        }
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

    const handleAddProductSubmit = (e) => {
        e.preventDefault();

        if (!selectedArea) {
            alert("Please select an area.");
            return;
        }

        // ✅ Create a new product object with selected area
        const newProduct = {
            ...productData,
            areaID: selectedArea,
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
             fetchTransactionsWithProducts(); // ✅ Ensure data is fully refreshed

            alert("Transaction and products have been successfully updated!");

            setLocalProducts([]); // ✅ Clear local products before closing modal
            handleClose(); // ✅ Close modal **only after table refreshes**
        } catch (error) {
            console.error("❌ Error saving transaction:", error);
            alert("Failed to save changes. Please try again.");
        }
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
                                        >
                                            <FontAwesomeIcon icon={faPenToSquare} />
                                        </span>
                                        <span
                                            style={{ color: "red", cursor: "pointer" }}
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
                            <li key={index}>{product.productName}</li>
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
        </>
    );
};

export default EditTransactionModal;
