import React, { useEffect, useState } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config";
import { Container, Table, Col, Row } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const RunningBalance = () => {
    const [runningBalanceData, setRunningBalanceData] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetchRunningBalance();
    }, []);

    const fetchRunningBalance = async () => {
        try {
            const response = await fetch(API_ENDPOINTS.RUNNING_BAL_LIST);
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            const data = await response.json();
            setRunningBalanceData(data);
        } catch (err) {
            console.error("Error fetching running balance:", err);
            setError("Failed to load running balance data.");
        } finally {
            setLoading(false);
        }
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
                    <MonthYearPicker />
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
                            runningBalanceData.map((item) => (
                                <tr key={item.itemID}>
                                    <td>{item.itemID}</td>
                                    <td>{item.productName}</td>
                                    <td>{item.unitMeasurement}</td>
                                    <td>{item.beginningBalance}</td>
                                    <td>{item.purchasedFromSupplier}</td>
                                    <td>{item.returnToSupplier}</td>
                                    <td>{item.transferFromWarehouse}</td>
                                    <td>{item.transferToWarehouse}</td>
                                    <td>{item.issuedQuantity}</td>
                                    <td>{item.returnedQuantity}</td>
                                    <td>{item.consumption}</td>
                                    <td>{item.availableStocks}</td>
                                    <td>{item.cost}</td>
                                    <td>{item.total}</td>
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
