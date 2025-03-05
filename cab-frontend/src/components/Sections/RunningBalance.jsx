import React, { useEffect, useState } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config";
import { Container, Table, Col, Row } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const RunningBalance = () => {
    const [runningBalanceData, setRunningBalanceData] = useState([]);
    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const fetchRunningBalance = async () => {
        try {
            const queryParams = new URLSearchParams({
                month: selectedMonth,
                year: selectedYear,
            });

            if(selectedMonth === 0){
                const response = await fetch(API_ENDPOINTS.RUNNING_BAL_LIST);
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                const data = await response.json();
                setRunningBalanceData(data);
            } else{
                const response = await fetch(`${API_ENDPOINTS.RUNNING_BAL_LIST}?${queryParams}`);
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                const data = await response.json();
                setRunningBalanceData(data);
            }
            
        } catch (err) {
            console.error("Error fetching running balance:", err);
            setError("Failed to load running balance data.");
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        createRunningBal();
        fetchRunningBalance();
    }, [selectedMonth, selectedYear]);

    const createRunningBal = () => {
        const token = localStorage.getItem("access_token");
        if (!token) {
            console.error("Authorization token is missing.");
            alert("Authorization token is missing. Please log in again.");
            return;
        }
        try {
            return fetch(API_ENDPOINTS.RUNNING_BAL_CREATE, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${token}`,
                },
            });
        } catch (error) {
            console.error("Error adding products:", error);
            alert("Some products could not be added. Please check your data.");
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
                    <h2 className="mt-5" style={{ fontWeight: "650" }}>Running Balance</h2>
                </Col>
            </Row>

            <Row>
                <Col>
                    <MonthYearPicker onMonthYearChange={handleMonthYearChange}/>
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input type="search" className="" placeholder="Search" style={{ width: "300px" }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover id="TtableStyle" className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Product Name</th>
                            <th>Unit of <br /> Measurement</th>
                            <th>Beginning Balance</th>
                            <th>Purchased from <br /> Supplier</th>
                            <th>Return to Supplier</th>
                            <th>Transfer From <br /> Other Warehouse</th>
                            <th>Transfer to <br /> Other Warehouse</th>
                            <th>Issued Qty.</th>
                            <th>Returned Qty.</th>
                            <th>Consumption</th>
                            <th>Available Stocks</th>
                            <th>Cost</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        {loading ? (
                            <tr>
                                <td colSpan="14" className="text-center">Loading data...</td>
                            </tr>
                        ) : error ? (
                            <tr>
                                <td colSpan="14" className="text-center text-danger">{error}</td>
                            </tr>
                        ) : runningBalanceData.length > 0 ? (
                            runningBalanceData.map((item, index) => (
                                <tr key={index}>
                                    <td>{item.itemID}</td>
                                    <td>{item.itemName}</td>
                                    <td>{item.measureName.measureName}</td>
                                    <td>{item.beginningBalance}</td>
                                    <td>{item.purchasedFromSupp}</td>
                                    <td>{item.returnToSupplier}</td>
                                    <td>{item.transferFromWH}</td>
                                    <td>{item.transferToWH}</td>
                                    <td>{item.issuedQty}</td>
                                    <td>{item.returnedQty}</td>
                                    <td>{item.consumption}</td>
                                    <td>{item.itemQuantity}</td>
                                    <td>₱ {item.unitCost}</td>
                                    <td>₱ {item.totalCost}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="14" className="text-center">No records found.</td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default RunningBalance;
