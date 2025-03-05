import React, { useState, useEffect } from "react";
import { API_ENDPOINTS } from "../../config.js";
import "../table.css";
import { Container, Table, Col, Row } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const BeginningBalance = () => {
    const [items, setItems] = useState([]);
    const [filteredItems, setFilteredItems] = useState([]);
    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [searchTerm, setSearchTerm] = useState("");

    // Fetch Beginning Balance Data with Token
    const fetchBeginningBalance = async () => {
        const token = localStorage.getItem("access_token");
        try {
            let response;
            if (selectedMonth === 0) {
                // If no specific month is selected, fetch all data
                response = await fetch(API_ENDPOINTS.BEGINNING_BAL_LIST, {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                });
            } else {
                // Fetch data for specific month and year
                const queryParams = new URLSearchParams({
                    month: selectedMonth + 1, // Add 1 back when sending to backend
                    year: selectedYear,
                });
                response = await fetch(`${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`, {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                });
            }

            if (!response.ok) {
                throw new Error("Failed to fetch beginning balance data");
            }

            const data = await response.json();
            setItems(data);
            setFilteredItems(data);
        } catch (e) {
            console.error("Error fetching beginning balance:", e);
            setError("Failed to load beginning balance data.");
        } finally {
            setLoading(false);
        }
    };

    // Create Beginning Balance
    const createBeginningBal = async () => {
        const token = localStorage.getItem("access_token");
        if (!token) {
            console.error("Authorization token is missing.");
            alert("Authorization token is missing. Please log in again.");
            return;
        }   
        try {            
            await fetch(API_ENDPOINTS.BEGINNING_BAL_CREATE, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Token ${token}`,
                },
            });
        } catch (e) {
            console.error("Error creating beginning balance:", e);
            setError("Failed to create beginning balance data.");
        }
    };

    // Search functionality
    const handleSearch = (event) => {
        const term = event.target.value.toLowerCase();
        setSearchTerm(term);

        const filtered = items.filter(item => 
            item.itemID.toString().toLowerCase().includes(term) ||
            item.itemName.toLowerCase().includes(term) ||
            item.measureName.measureName.toLowerCase().includes(term)
        );

        setFilteredItems(filtered);
    };

    // Month and Year change handler
    const handleMonthYearChange = (month, year) => {
        // Subtract 1 to convert from 1-12 to 0-11 indexing
        setSelectedMonth(month - 1);
        setSelectedYear(year);
    };

    // Fetch data on component mount and when month/year changes
    useEffect(() => {
        fetchBeginningBalance();
    }, [selectedMonth, selectedYear]);

    // Create beginning balance on component mount
    useEffect(() => {
        createBeginningBal();
    }, []);

    return (
        <Container style={{ width: "100%" }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 className="mt-5" style={{ fontWeight: "650" }}>Beginning Balance</h2>
                </Col>
            </Row>

            <Row>
                <Col>
                    <MonthYearPicker onMonthYearChange={handleMonthYearChange} />
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input 
                        type="search" 
                        placeholder="Search" 
                        style={{ width: "300px" }}
                        value={searchTerm}
                        onChange={handleSearch}
                        className="form-control"
                    />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Product <br /> Name</th>
                            <th>Unit of <br /> Measurement</th>
                            <th>Available Stocks</th>
                            <th>Average Unit <br /> Cost</th>
                            <th>Total Cost of <br /> Available Stocks</th>
                        </tr>
                    </thead>
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan="6" className="text-center">Loading data...</td>
                            </tr>
                        ) : error ? (
                            <tr>
                                <td colSpan="6" className="text-center text-danger">{error}</td>
                            </tr>
                        ) : filteredItems.length > 0 ? (
                            filteredItems.map((item, index) => (
                                <tr key={index}>
                                    <td>{item.itemID}</td>
                                    <td>{item.itemName}</td>
                                    <td>{item.measureName.measureName}</td>
                                    <td>{item.itemQuantity}</td>
                                    <td>₱{item.unitCost}</td>
                                    <td>₱{item.totalCost}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="6" className="text-center">No records found.</td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default BeginningBalance;