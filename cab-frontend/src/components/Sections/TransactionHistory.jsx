import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom'; // Import useNavigate
import { API_ENDPOINTS } from '../../config';
import { Table, Container, Spinner, Alert, Button, Row } from 'react-bootstrap';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowLeft, faArrowRight } from '@fortawesome/free-solid-svg-icons';

const TransactionHistory = () => {
    const { itemID, itemName } = useParams();
    const navigate = useNavigate(); // Initialize useNavigate
    const [transactions, setTransactions] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchHistory = async () => {
            try {
                const token = localStorage.getItem("access_token");
                if (!token) {
                    throw new Error("No authentication token found");
                }

                const url = `${API_ENDPOINTS.TRANSACTION_HISTORY}?itemID=${encodeURIComponent(itemID)}`;
                console.log("Fetching from:", url); // Debug URL

                const response = await fetch(url, {
                    headers: {
                        Authorization: `Token ${token}`,
                        "Content-Type": "application/json"
                    }
                });

                console.log("Response status:", response.status); // Log status code

                if (!response.ok) {
                    const errorText = await response.text();
                    throw new Error(`API Error ${response.status}: ${errorText}`);
                }

                const data = await response.json();
                console.log("Received data:", data); // Debug response data
                setTransactions(data.results || data); // Handle different response formats

            } catch (err) {
                console.error("Fetch error details:", err);
                setError(err.message || "Failed to load transaction history");
            } finally {
                setLoading(false);
            }
        };
        fetchHistory();
    }, [itemID]);

    const formatCurrency = (value) => {
        return `₱${parseFloat(value).toLocaleString("en-PH", {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2,
        })}`;
    };

    return (
        <Container style={{ width: "100%" }}
            fluid
            className="d-flex flex-column justify-content-center mt-2">
            <Row className="d-flex flex-column mt-5">
                <div className="d-flex justify-content-start">
                    <Button
                        variant="outline-primary"
                        size="sm"
                        style={{ fontSize: "15px" }}
                        onClick={() => navigate(-1)} // Navigate back to the previous page
                    >
                        <FontAwesomeIcon icon={faArrowLeft} />
                    </Button>
                </div>
                <h3
                    className="sectionTitle"
                    style={{
                        fontWeight: "650",
                        textAlign: "center", // Center the text
                    }}
                >
                    Transaction History for {itemName} {itemID}
                </h3>
            </Row>
            {loading ? (
                <Spinner animation="border" />
            ) : error ? (
                <Alert variant="danger">{error}</Alert>
            ) : (
                <Table className='tableStyle mt-2' striped bordered hover>
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Week</th>
                            <th>MRIS/DR</th>
                            <th>Supplier</th>
                            <th>Requested <br /> By</th>
                            <th>Section</th>
                            <th>Purpose</th>
                            <th>Product Name</th>
                            <th>Area</th>
                            <th>Purchased from <br /> Supplier</th>
                            <th>Return to <br />Supplier</th>
                            <th>Transfer from <br />Other Warehouse</th>
                            <th>Transfer to <br />Other Warehouse</th>
                            <th>Issued <br /> Qty.</th>
                            <th>Returned <br /> Qty.</th>
                            <th>Consumption</th>
                            <th>Cost</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        {transactions.map((txn) => (
                            <tr key={txn.transactionProductID}>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>{txn.itemName}</td>
                                <td>{txn.areaName}</td>
                                <td>{txn.purchasedFromSupp}</td>
                                <td>{txn.returnToSupplier}</td>
                                <td>{txn.transferFromWH}</td>
                                <td>{txn.transferToWH}</td>
                                <td>{txn.issuedQty}</td>
                                <td>{txn.returnedQty}</td>
                                <td>{txn.consumption}</td>
                                <td>{formatCurrency(txn.cost)}</td>
                                <td>{formatCurrency(txn.total)}</td>
                            </tr>
                        ))}
                    </tbody>
                </Table>
            )}
        </Container>
    );
};

export default TransactionHistory;