import { faPenToSquare, faTrashAlt } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import React, { useState, useEffect } from 'react';
import { API_ENDPOINTS } from "../../config";
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
    setProductData,
    selectedSection,
    setSelectedSection,
    selectedPurpose,
    setSelectedPurpose,
    selectedProduct,
    setSelectedProduct,
    selectedArea,
    setSelectedArea
}) => {
    const [editProductIndex, setEditProductIndex] = useState(null);
    const [showEditProductModal, setShowEditProductModal] = useState(false);
    const [editProductData, setEditProductData] = useState({});
    const [sections, setSections] = useState([]);
    const [purpose, setPurpose] = useState([]);
    const [products, setProducts] = useState([]);
    const [area, setArea] = useState([]);
    const [filteredProducts, setFilteredProducts] = useState([]);
    const [setEditSelectedArea, setSelectedEditArea] = useState('');

    useEffect(() => {
        fetchSections();
        fetchPurpose();
        fetchProducts();
        fetchArea();
        setSelectedEditArea(productData?.areaID || '')
    }, [productData]);

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

    const handleAreaChange = (event) => {
        setSelectedArea(event.target.value);
    };

    const handleEditAreaChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedEditArea(selectedId);
        handleProductChange({
            target: {
                name: 'areaID',
                value: selectedId,
            }
        });
    };

    const handlePurposeChange = (event) => {
        setSelectedPurpose(event.target.value);
    };

    const handleSectionChange = (event) => {
        setSelectedSection(event.target.value);
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
                            <Form.Select name="section" value={selectedSection} onChange={handleSectionChange} required>
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
                            <Form.Select name="purpose" value={selectedPurpose} onChange={handlePurposeChange} required>
                                <option value="">Select Purpose</option>
                                {purpose.map((purpose) => (
                                    <option key={purpose.purposeID} value={purpose.purposeID}>
                                        {purpose.purposeName}
                                    </option>
                                ))}
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
                            <Form.Select name="area" value={selectedArea} onChange={handleAreaChange} required>
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
                                <option value="PurchaseSupply">Purchased from Supplier</option>
                                <option value="ReturnSupply">Return to Supplier</option>
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
                            <Form.Select name="area" value={setEditSelectedArea} onChange={handleEditAreaChange} required>
                                {area.map((area) => (
                                    <option key={area.areaID} value={area.areaID}>
                                        {area.areaName}
                                    </option>
                                ))}
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