import React, { useState, useEffect } from 'react';
import { Modal, Form, Button, Row, Col } from 'react-bootstrap';
import { API_ENDPOINTS } from "../../config";

const EditTransactionModal = ({
    show,
    handleClose,
    handleSubmit,
    transactionData,
    handleChange,
    setEditTransactionData,
}) => {
    const [sections, setSections] = useState([]);
    const [purpose, setPurpose] = useState([]);
    const [transactionProducts, setTransactionProducts] = useState([]);
    const [selectedSection, setSelectedSection] = useState(0);
    const [selectedPurpose, setSelectedPurpose] = useState(0);

    // ✅ Fetch sections & purpose on mount
    useEffect(() => {
        fetchSections();
        fetchPurpose();
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

    return (
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

                    {/* ✅ Display Products for the Transaction */}
                    <h5>Products</h5>
                    {transactionProducts.length > 0 ? (
                        <ul className="mt-3">
                            {transactionProducts.map((product) => (
                                <li key={product.transactionProductID}>
                                    {product.itemName} {/* ✅ Display product name instead of itemID */}
                                </li>
                            ))}
                        </ul>
                    ) : (
                        <p className="text-muted">No products added to this transaction</p>
                    )}
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
    );
};

export default EditTransactionModal;
