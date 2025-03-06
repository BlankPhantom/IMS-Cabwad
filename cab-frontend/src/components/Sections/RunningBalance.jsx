import React, { useEffect, useState } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config";
import { Container, Table, Col, Row, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const RunningBalance = () => {
    const [runningBalanceData, setRunningBalanceData] = useState([]);
    const [filteredData, setFilteredData] = useState([]);
    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth() + 1);
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    const [searchTerm, setSearchTerm] = useState("");
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const fetchRunningBalance = async () => {
        const token = localStorage.getItem("access_token");
        try {
            let url = API_ENDPOINTS.RUNNING_BAL_LIST;

            // If a specific month is selected (not the default 'All')
            if (selectedMonth !== 0) {
                const queryParams = new URLSearchParams({
                    month: selectedMonth,
                    year: selectedYear,
                });
                url = `${url}?${queryParams}`;
            }

            const response = await fetch(url, {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${token}`,
                },
            });

            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }

            const data = await response.json();
            setRunningBalanceData(data);
            setFilteredData(data);
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

    // Handle search functionality
    const handleSearch = (event) => {
        const term = event.target.value.toLowerCase();
        setSearchTerm(term);

        const filtered = runningBalanceData.filter(item =>
            item.itemID.toLowerCase().includes(term) ||
            item.itemName.toLowerCase().includes(term)
        );

        setFilteredData(filtered);
    };

    // Handle month and year change
    const handleMonthYearChange = (month, year) => {
        // Convert month to correct format
        setSelectedMonth(month);
        setSelectedYear(year);
    };

    // Fetch data when month/year changes
    useEffect(() => {
        fetchRunningBalance();
    }, [selectedMonth, selectedYear]);

    return (
        <Container style={{ width: "100%" }} fluid className="d-flex flex-column justify-content-center mt-2">
            <Row className="sectionTitle">
                <Col>
                    <h2 className="mt-5" style={{ fontWeight: "650" }}>Running Balance</h2>
                </Col>
            </Row>

            <Row className="mb-3">
                <Col>
                    <MonthYearPicker
                        onMonthYearChange={handleMonthYearChange}
                        initialMonth={selectedMonth}
                        initialYear={selectedYear}
                    />
                </Col>

            </Row>

            <Row>
                <Col className="d-flex justify-content-end">
                    <Form.Control
                        type="search"
                        className="form-control"
                        placeholder="Search"
                        value={searchTerm}
                        onChange={handleSearch}
                        style={{ width: "300px" }}
                    />
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
                        ) : filteredData.length > 0 ? (
                            filteredData.map((item, index) => (
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
                                <td colSpan="14" className="text-center">
                                    {searchTerm
                                        ? `No results found for "${searchTerm}"`
                                        : "No records found."
                                    }
                                </td>
                            </tr>
                        )}
                    </tbody>
                </Table>
            </Row>
        </Container>
    );
};

export default RunningBalance;