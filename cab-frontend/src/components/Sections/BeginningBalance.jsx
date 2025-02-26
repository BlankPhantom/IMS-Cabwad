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

    // Fetch Beginning Balance Data with Token
    const fetchBeginningBalance = async () => {
        const token = localStorage.getItem("access_token");
        try {
            const queryParams = new URLSearchParams({
                month: selectedMonth,
                year: selectedYear,
            });

            if (selectedMonth === 0){
                const response = await fetch(API_ENDPOINTS.BEGINNING_BAL_LIST, {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                });
    
                if (!response.ok) {
                    throw new Error("Failed to fetch beginning balance data");
                }
    
                const data = await response.json();
                setItems(data);
            } else {
                const response = await fetch(`${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`, {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                });
    
                if (!response.ok) {
                    throw new Error("Failed to fetch beginning balance data");
                }
                
                console.log(`${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`)

                const data = await response.json();
                setItems(data);
            }
            
        } catch (e) {
            console.error("Error fetching beginning balance:", e);
            setError("Failed to load beginning balance data.");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchBeginningBalance();
    }, [selectedMonth, selectedYear]);

    useEffect(() => {
        createBegginingBal();
    }, []);

    const createBegginingBal = async() => {
        const token = localStorage.getItem("access_token");
        if (!token) {
            console.error("Authorization token is missing.");
            alert("Authorization token is missing. Please log in again.");
            return;
        }   
        try {            
                const response = fetch(API_ENDPOINTS.BEGINNING_BAL_CREATE, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                });
        } catch (e) {
            console.error("Error fetching beginning balance:", e);
            setError("Failed to load beginning balance data.");
        } finally {
            setLoading(false);
        }
    };

    const handleMonthYearChange = (month, year) => {
        setSelectedMonth(month);
        setSelectedYear(year);
    };

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
                    <input type="search" className="" placeholder="Search" style={{ width: "300px" }} />
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
                        ) : items.length > 0 ? (
                            items.map((item, index) => (
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
