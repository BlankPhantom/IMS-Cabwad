import React, { useState, useEffect } from 'react';
import { Modal, Form, Button, Row, Col } from 'react-bootstrap';
import { faPenToSquare, faTrashAlt } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { API_ENDPOINTS } from "../../config";

const EditTransactionModal = ({
    show,
    handleClose,
    handleSubmit,
    transactionData,
    handleChange,
    setEditTransactionData,
    productData,
}) => {
    const [editProductIndex, setEditProductIndex] = useState(null);
    const [editProductData, setEditProductData] = useState({});
    const [sections, setSections] = useState([]);
    const [purpose, setPurpose] = useState([]);
    const [products, setProducts] = useState([]);
    const [area, setArea] = useState([]);
    const [selectedSection, setSelectedSection] = useState(0);
    const [selectedPurpose, setSelectedPurpose] = useState(0);

    const [filteredProducts, setFilteredProducts] = useState([]);

    useEffect(() => {
        fetchSections();
        fetchPurpose();
        fetchProducts();
        fetchArea();
    }, []); // ✅ Run only once when the modal is mounted

    useEffect(() => {
        if (transactionData) {
            setSelectedSection(transactionData.sectionID || "");
            setSelectedPurpose(transactionData.purposeID || "");
        }
    }, [transactionData]);

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

    const handleEditAreaChange = (e) => {
        const selectedId = parseInt(e.target.value, 10);
        setSelectedEditArea(selectedId);
        console.log(setEditSelectedArea)
        handleProductChange({
            target: {
                name: 'areaID',
                value: selectedId,
            }
        });
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

    const handleEditProduct = (index) => {
        const product = transactionData.products[index];
        setEditProductIndex(index);
        setEditProductData(product);
        setTransactionType(product.transactionType || ''); // Set the transaction type based on the product being edited
        setShowEditProductModal(true);
    };

    const handleDeleteProduct = (index) => {
        const updatedProducts = transactionData.products.filter((_, i) => i !== index);
        setEditTransactionData({ ...transactionData, products: updatedProducts });
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
        setEditTransactionData({ ...transactionData, products: updatedProducts });
        setShowEditProductModal(false);
    };

    const handleEditProductChange = (e) => {
        const { name, value } = e.target;
        setEditProductData((prevData) => ({ ...prevData, [name]: value }));
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
                            <Button onClick={() => setShowProductModal(true)} variant="primary">
                                Add Product
                            </Button>
                        </div>

                        <div className="d-flex justify-content-end gap-2 mt-3">
                            <Button variant="danger" onClick={handleClose}>
                                Cancel
                            </Button>
                            <Button type="submit" variant="primary">
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