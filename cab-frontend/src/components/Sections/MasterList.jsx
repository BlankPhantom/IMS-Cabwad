import React, { useState, useEffect } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config.js";
import { Container, Table, Col, Row, Pagination } from "react-bootstrap";
import BtnAddNewItem from "../Button/BtnAddNewItem.jsx";
import BtnEditDeleteMaster from "../Button/BtnEditDeleteMaster.jsx";
import EditMasterModal from "../Modals/EditMasterModal.jsx";

const Masterlist = () => {
    const [items, setItems] = useState([]);
    const [filteredItems, setFilteredItems] = useState([]);
    const [classifications, setClassifications] = useState([]);
    const [measurements, setMeasurements] = useState([]);
    const [showModal, setShowModal] = useState(false);
    const [currentItem, setCurrentItem] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');

    // Pagination states
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage] = useState(20);

    const fetchClassifications = async () => {
        const token = localStorage.getItem('access_token');

        try {
            const response = await fetch(API_ENDPOINTS.CLASSIFICATIONS_LIST, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Token ${token}`,
                },
            });

            if (!response.ok) {
                throw new Error("Failed to fetch classifications");
            } else {
                const data = await response.json();
                setClassifications(data);
            }
        } catch (e) {
            console.error("Error fetching classifications:", e);
        }
    }

    const fetchMeasurements = async () => {
        const token = localStorage.getItem('access_token');

        try {
            const response = await fetch(API_ENDPOINTS.MEASUREMENTS_LIST, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Token ${token}`,
                },
            });

            if (!response.ok) {
                throw new Error("Failed to fetch measurements");
            } else {
                const data = await response.json();
                setMeasurements(data);
            }
        }
        catch (e) {
            console.error("Error fetching measurements:", e);
        }
    }

    useEffect(() => {
        fetchClassifications();
        fetchMeasurements();
    }, []);

    // fetch items with token
    const fetchItems = async () => {
        setLoading(true);
        const token = localStorage.getItem('access_token');

        try {
            const response = await fetch(API_ENDPOINTS.ITEM_LIST, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Token ${token}`,
                },
            });

            if (response.ok) {
                const data = await response.json();
                setItems(data);
                setFilteredItems(data);
            } else {
                console.error('Failed to fetch items');
                setError("Failed to load items data.");
            }
        } catch (error) {
            console.error('Error fetching items:', error);
            setError("Failed to load items data.");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchItems();
    }, []);

    // Search handler
    const handleSearchChange = (e) => {
        const term = e.target.value;
        setSearchTerm(term);

        // Filter items based on search term
        const filtered = items.filter((item) =>
            item.itemID.toLowerCase().includes(term.toLowerCase()) ||
            item.itemName.toLowerCase().includes(term.toLowerCase()) ||
            item.classificationName.toLowerCase().includes(term.toLowerCase())
        );

        setFilteredItems(filtered);
        setCurrentPage(1); // Reset to first page when searching
    };

    const handleDelete = (id) => {
        const item = items.find(item => item.itemID === id);
        if (item) {
            const confirmDelete = window.confirm(`Are you sure you want to delete the item "${item.itemName}" (ID: ${item.itemID})?`);

            if (confirmDelete) {
                deleteItem(item.itemID);
            }
        }
    }

    const deleteItem = async (id) => {
        const token = localStorage.getItem('access_token');
        try {
            const response = await fetch(API_ENDPOINTS.DELETE_ITEM(id), {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Token ${token}`,
                },
            });
            if (!response.ok) {
                throw new Error("Failed to delete item");
            }
            fetchItems();
            setCurrentItem(null);
            window.alert('Item deleted successfully!');

        } catch (e) {
            console.error("Error deleting item:", e);
            window.alert('Failed to delete item.');
        }
    };

    const handleEdit = (id) => {
        const item = items.find(item => item.itemID === id);
        if (item) {
            setCurrentItem(item);
            setShowModal(true);
        }
    };

    const handleCloseModal = () => {
        setShowModal(false);
        setCurrentItem(null);
    };

    const handleSaveChanges = async (updatedItemData) => {
        const token = localStorage.getItem('access_token');
        try {
            const response = await fetch(API_ENDPOINTS.UPDATE_ITEM(updatedItemData.itemID), {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Token ${token}`,
                },
                body: JSON.stringify(updatedItemData),
            });
            if (!response.ok) {
                throw new Error("Failed to update item");
            }
            fetchItems();
            handleCloseModal();
            window.alert('Item updated successfully!');
        } catch (e) {
            console.error("Error updating item:", e);
            window.alert('Failed to update item.');
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setCurrentItem(prevState => ({
            ...prevState,
            [name]: name === 'classificationID' || name === 'measurementID' ? parseInt(value, 10) : value,
        }));
    };

    // Pagination logic
    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = filteredItems.slice(indexOfFirstItem, indexOfLastItem);

    const totalPages = Math.ceil(filteredItems.length / itemsPerPage);

    const paginate = (pageNumber) => setCurrentPage(pageNumber);

    // Generate pagination items
    const renderPaginationItems = () => {
        const items = [];

        // Previous button
        items.push(
            <Pagination.First
                key="first"
                onClick={() => paginate(1)}
                disabled={currentPage === 1}
            />
        );

        items.push(
            <Pagination.Prev
                key="prev"
                onClick={() => currentPage > 1 && paginate(currentPage - 1)}
                disabled={currentPage === 1}
            />
        );

        // Show first page
        if (currentPage > 2) {
            items.push(
                <Pagination.Item key={1} onClick={() => paginate(1)}>
                    1
                </Pagination.Item>
            );

            // Show ellipsis if needed
            if (currentPage > 3) {
                items.push(<Pagination.Ellipsis key="ellipsis1" disabled />);
            }
        }

        // Current page and neighbors
        for (let i = Math.max(1, currentPage - 2); i <= Math.min(totalPages, currentPage + 2); i++) {
            items.push(
                <Pagination.Item key={i} active={i === currentPage} onClick={() => paginate(i)}>
                    {i}
                </Pagination.Item>
            );
        }

        // Show ellipsis and last page if needed
        if (currentPage < totalPages - 1) {
            if (currentPage < totalPages - 2) {
                items.push(<Pagination.Ellipsis key="ellipsis2" disabled />);
            }

            items.push(
                <Pagination.Item key={totalPages} onClick={() => paginate(totalPages)}>
                    {totalPages}
                </Pagination.Item>
            );
        }

        // Next button
        items.push(
            <Pagination.Next
                key="next"
                onClick={() => currentPage < totalPages && paginate(currentPage + 1)}
                disabled={currentPage === totalPages}
            />
        );

        items.push(
            <Pagination.Last
                key="last"
                onClick={() => paginate(totalPages)}
                disabled={currentPage === totalPages}
            />
        );

        return items;
    };


    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 className="mt-5" style={{ fontWeight: '650' }}>Master List</h2>
                </Col>
            </Row>
            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input
                        type="search"
                        className="form-control"
                        placeholder="Search"
                        style={{ width: '300px' }}
                        value={searchTerm}
                        onChange={handleSearchChange}
                    />
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
                        {loading ? (
                            <tr>
                                <td colSpan="4" className="text-center">Loading data...</td>
                            </tr>
                        ) : error ? (
                            <tr>
                                <td colSpan="4" className="text-center text-danger">{error}</td>
                            </tr>
                        ) : currentItems.length > 0 ? (
                            currentItems.map((item) => (
                                <tr key={item.id}>
                                    <td>{item.itemID}</td>
                                    <td>{item.itemName}</td>
                                    <td>{item.classificationName}</td>
                                    <td>
                                        <BtnEditDeleteMaster
                                            onEdit={() => handleEdit(item.itemID)}
                                            onDelete={() => handleDelete(item.itemID)}
                                        />
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="4" className="text-center">No items found</td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </Row>

            {/* Pagination */}
            {!loading && !error && filteredItems.length > 0 && (
                <Row>
                    <Col className="d-flex justify-content-center mt-3">
                        <Pagination>{renderPaginationItems()}</Pagination>
                    </Col>
                </Row>
            )}

            <Row>
                <Col className="d-flex justify-content-end">
                    <BtnAddNewItem
                        fetchItems={fetchItems}
                        classifications={classifications}
                        measurements={measurements}
                    />
                </Col>
            </Row>

            <EditMasterModal
                show={showModal}
                handleClose={handleCloseModal}
                itemData={currentItem}
                handleInputChange={handleChange}
                handleSave={handleSaveChanges}
                classifications={classifications}
                measurements={measurements}
            />
        </Container>
    );
};

export default Masterlist;