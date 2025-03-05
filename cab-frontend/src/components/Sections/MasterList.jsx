import React, { useState, useEffect } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config.js";
import { Button, Container, Table, Col, Row } from "react-bootstrap";
import BtnAddNewItem from "../Button/BtnAddNewItem.jsx";
import BtnEditDeleteMaster from "../Button/BtnEditDeleteMaster.jsx";
import EditMasterModal from "../Modals/EditMasterModal.jsx";

const Masterlist = () => {
    const [items, setItems] = useState([]);
    const [filteredItems, setFilteredItems] = useState([]);
    const [classifications, setClassifications] = useState([]);
    const [measurements, setMeasurements] = useState([]);
    const [showModal, setShowModal] = useState(false);
    const [currentItem, setCurrentItem] = useState([]);
    const [successMessage, setSuccessMessage] = useState('');
    const [searchTerm, setSearchTerm] = useState('');

    const fetchClassifications = async() => {
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
    
    const fetchMeasurements = async() => {
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
            }else{
                const data = await response.json();
                setMeasurements(data);
            }
        }
        catch(e){
            console.error("Error fetching measurements:", e);
        }
    }

    useEffect(() => {
        fetchClassifications();
        fetchMeasurements();
    }, []);

    // fetch items with token
    const fetchItems = async () => {
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
          }
        } catch (error) {
          console.error('Error fetching items:', error);
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
    };

    const handleDelete = (id) => {
        console.log('button clicked');
        
        const item = items.find(item => item.itemID === id);
        console.log(item);
        if (item){
            setCurrentItem(item);
            deleteItem(item.itemID);
        };
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
            setCurrentItem();
            console.log('current item after delete' + currentItem)
           
        } catch (e) {
            console.error("Error deleting item:", e);
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
        setCurrentItem();
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
            setSuccessMessage('Item updated successfully!');
            setTimeout(() => setSuccessMessage(''), 3000); // Clear message after 3 seconds
        } catch (e) {
            console.error("Error updating item:", e);
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setCurrentItem(prevState => ({
            ...prevState,
            [name]: name === 'classificationID' || name === 'measurementID' ? parseInt(value, 10) : value,
        }));
    };

    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 className="mt-5" style={{fontWeight: '650'}}>Master List</h2>
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

            {successMessage && (
                <Row>
                    <Col>
                        <div className="alert alert-success" role="alert">
                            {successMessage}
                        </div>
                    </Col>
                </Row>
            )}

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
                        {filteredItems.map((item) => (
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
                        ))}
                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
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