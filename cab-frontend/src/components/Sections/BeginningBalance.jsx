import React from "react";
import { useState, useEffect } from "react";
import {API_ENDPOINTS} from "../../config.js";
import "../table.css";

import { Button, Container, Table, Col, Row } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const BeginningBalance = () => {
    const [items, setItems] = useState([]);
    const [filteredItems, setFilteredItems] = useState([]);
    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    
    // fetchItems without token 
    // const fetchItems = async() => {
    //     try {
    //         const response = await fetch(API_ENDPOINTS.ITEM_LIST); // Replace with your actual endpoint
    //             if (!response.ok) {
    //             throw new Error("Failed to fetch items");
    //         }
    //         const data = await response.json();
    //         setItems(data);
    //     } catch (e) {
    //         console.error("Error fetching items:", e);
    //     }
    // }

    // fetchItems with token
    const fetchItems = async() => {
        const token = localStorage.getItem('access_token');
        try {
            const response = await fetch(API_ENDPOINTS.ITEM_LIST, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Token ${token}`,
                },
            }); // Replace with your actual endpoint
            if (!response.ok) {
                throw new Error("Failed to fetch items");
            } else{
                const data = await response.json();
                setItems(data);
            }
        } catch (e) {
            console.error("Error fetching items:", e);
        }
    }

    useEffect(() => {
        fetchItems();
    }, []); 

    useEffect(() => {
        filterAndSortItems();
    }, [items, selectedMonth, selectedYear]);

    const filterAndSortItems = () => {
        const filtered = items.filter(item => {
            const updatedAt = new Date(item.updated_at);
            return updatedAt.getMonth() === selectedMonth && updatedAt.getFullYear() === selectedYear;
        });

        const sorted = filtered.sort((a, b) => new Date(b.updated_at) - new Date(a.updated_at));
        setFilteredItems(sorted);
    };

    const handleMonthYearChange = (month, year) => {
        setSelectedMonth(month);
        setSelectedYear(year);
    };

    return (
        <Container style={{ width: '100%' }} fluid className="d-flex flex-column justify-content-center mt-5">
            <Row>
                <Col>
                    <MonthYearPicker onMonthYearChange={handleMonthYearChange} />
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input type="search" className="" placeholder="Search" style={{ width: '300px' }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <th>Item ID</th>
                        <th>Product <br/> Name</th>
                        <th>Unit of <br/> Measurement</th>
                        <th>Available Stocks</th>
                        <th>Average Unit <br/> Cost</th>
                        <th>Total Cost of <br/> Available Stocks</th>
                        <th>Actions</th>
                    </thead>
                    <tbody>
                        {items.map((item) => (
                            <tr key={item.id}>
                                <td>{item.itemID}</td>
                                <td>{item.itemName}</td>
                                <td>{item.measurementName}</td>
                                <td>{item.itemQuantity}</td>
                                <td>₱{item.unitCost}</td>
                                <td>₱{item.totalCost}</td>
                            </tr>
                        ))}
                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default BeginningBalance;