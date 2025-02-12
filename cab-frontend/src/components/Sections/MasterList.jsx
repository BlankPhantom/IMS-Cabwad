import React, { useState, useEffect } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config.js";
import { Button, Container, Table, Col, Row } from "react-bootstrap";
import BtnAddNewItem from "../Button/BtnAddNewItem.jsx";
import BtnEditDeleteMaster from "../Button/BtnEditDeleteMaster.jsx";
import EditMasterModal from "../Modals/EditMasterModal.jsx";

const Masterlist = () => {
    const [items, setItems] = useState([]);

    const fetchItems = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.ITEM_LIST);
            if (!response.ok) {
                throw new Error("Failed to fetch items");
            }
            const data = await response.json();
            setItems(data);
        } catch (e) {
            console.error("Error fetching items:", e);
        }
    };

    useEffect(() => {
        fetchItems();
    }, []);

    const handleDelete = async (id) => {
        try {
            const response = await fetch(`${API_ENDPOINTS.ITEM_LIST}/${id}`, {
                method: 'DELETE',
            });
            if (!response.ok) {
                throw new Error("Failed to delete item");
            }
            fetchItems();
        } catch (e) {
            console.error("Error deleting item:", e);
        }
    };

    const [showModal, setShowModal] = useState(false);
    const [currentItem, setCurrentItem] = useState({ itemID: '', itemName: '', classificationName: '' });

    const handleEdit = (id) => {
        const item = items.find(item => item.id === id);
        setCurrentItem(item);
        setShowModal(true);
    };

    const handleCloseModal = () => {
        setShowModal(false);
        setCurrentItem({ itemID: '', itemName: '', classificationName: '' });
    };

    const handleSaveChanges = async () => {
        try {
            const response = await fetch(`${API_ENDPOINTS.ITEM_LIST}/${currentItem.id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(currentItem),
            });
            if (!response.ok) {
                throw new Error("Failed to update item");
            }
            fetchItems();
            handleCloseModal();
        } catch (e) {
            console.error("Error updating item:", e);
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setCurrentItem(prevState => ({
            ...prevState,
            [name]: value,
        }));
    };

    return (
        <Container style={{ width: '90%' }} fluid className="d-flex flex-column justify-content-center mt-5">
            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input type="search" className="" placeholder="Search" style={{ width: '300px' }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Product Name</th>
                            <th>Classification</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {items.map((item) => (
                            <tr key={item.id}>
                                <td>{item.itemID}</td>
                                <td>{item.itemName}</td>
                                <td>{item.classificationName}</td>
                                <td>
                                    <BtnEditDeleteMaster
                                        onEdit={() => handleEdit(item.id)}
                                        onDelete={() => handleDelete(item.id)}
                                    />
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <BtnAddNewItem fetchItems={fetchItems} />
                </Col>
            </Row>

            <EditMasterModal
                show={showModal}
                handleClose={handleCloseModal}
                itemData={currentItem}
                handleInputChange={handleChange}
                handleSave={handleSaveChanges}
            />
        </Container>
    );
};

export default Masterlist;