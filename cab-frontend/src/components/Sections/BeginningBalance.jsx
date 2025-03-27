import React, { useState, useEffect } from "react";
import { API_ENDPOINTS } from "../../config.js";
import "../table.css";
import { Container, Table, Col, Row, Pagination } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const BeginningBalance = () => {
    const [items, setItems] = useState([]);
    const [filteredItems, setFilteredItems] = useState([]);
    const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
    const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [searchTerm, setSearchTerm] = useState("");

    // Pagination states
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage] = useState(20);

    // Fetch Beginning Balance Data with Token
    const fetchBeginningBalance = async () => {
        const token = localStorage.getItem("access_token");
        try {
            let response;
        
           
            // Fetch data for specific month and year
            const queryParams = new URLSearchParams({
                month: selectedMonth + 1 , 
                year: selectedYear,
            });
            response = await fetch(`${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`, {
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
            setFilteredItems(data);
            setCurrentPage(1); // Reset to first page when new data is loaded
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
            fetchBeginningBalance();
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
        setCurrentPage(1); // Reset to first page when search filter changes
    };

    // Month and Year change handler
    const handleMonthYearChange = (month, year) => {
        setLoading(true);
        setSelectedMonth(month);
        setSelectedYear(year);
    };

    // Pagination handler
    const handlePageChange = (pageNumber) => {
        setCurrentPage(pageNumber);
    };

    // Get current items for the current page
    const indexOfLastItem = currentPage * itemsPerPage;
    const indexOfFirstItem = indexOfLastItem - itemsPerPage;
    const currentItems = filteredItems.slice(indexOfFirstItem, indexOfLastItem);

    // Calculate total pages
    const totalPages = Math.ceil(filteredItems.length / itemsPerPage);

    // Generate page numbers
    const pageNumbers = [];
    for (let i = 1; i <= totalPages; i++) {
        pageNumbers.push(i);
    }

    useEffect(() => {
        // Use a flag to track if we're currently fetching/creating
        let isMounted = true;
        let isProcessing = false;
        
        const fetchAndCreateIfNeeded = async () => {
            if (isProcessing) return;
            isProcessing = true;
            
            const token = localStorage.getItem("access_token");
            try {
                // First, check if data exists for this month/year
                const queryParams = new URLSearchParams({
                    month: selectedMonth + 1,
                    year: selectedYear,
                });
                
                const checkResponse = await fetch(`${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`, {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Token ${token}`,
                    },
                });
                
                if (!checkResponse.ok) {
                    throw new Error("Failed to check beginning balance data");
                }
                
                const existingData = await checkResponse.json();
                
                // Only create if no data exists AND component is still mounted
                if (existingData.length === 0 && isMounted) {
                    console.log("No data found for selected month/year. Creating new entries...");
                    
                    await fetch(API_ENDPOINTS.BEGINNING_BAL_CREATE, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            Authorization: `Token ${token}`,
                        },
                    });
                }
                
                // Only fetch final data if component is still mounted
                if (isMounted) {
                    // Fetch the updated data
                    const finalResponse = await fetch(`${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`, {
                        method: "GET",
                        headers: {
                            "Content-Type": "application/json",
                            Authorization: `Token ${token}`,
                        },
                    });
                    
                    if (!finalResponse.ok) {
                        throw new Error("Failed to fetch updated beginning balance data");
                    }
                    
                    const finalData = await finalResponse.json();
                    setItems(finalData);
                    setFilteredItems(finalData);
                    setCurrentPage(1);
                }
                
            } catch (e) {
                console.error("Error in fetch and create flow:", e);
                if (isMounted) {
                    setError("Failed to initialize beginning balance data.");
                }
            } finally {
                isProcessing = false;
                if (isMounted) {
                    setLoading(false);
                }
            }
        };
        
        fetchAndCreateIfNeeded();
        
        // Cleanup function to prevent state updates if component unmounts
        return () => {
            isMounted = false;
        };
    }, [selectedMonth, selectedYear]);

    const formatCurrency = (value) => {
        return `₱${parseFloat(value).toLocaleString('en-PH', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        })}`;
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
                        ) : currentItems.length > 0 ? (
                            currentItems.map((item, index) => (
                                <tr key={index}>
                                    <td>{item.itemID}</td>
                                    <td>{item.itemName}</td>
                                    <td>{item.measurementName}</td>
                                    <td>{item.itemQuantity}</td>
                                    <td>{formatCurrency(item.unitCost)}</td>
                                    <td>{formatCurrency(item.totalCost)}</td>
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

            {/* Pagination */}
            {!loading && !error && filteredItems.length > 0 && (
                <Row>
                    <Col className="d-flex justify-content-center mt-3">
                        <Pagination>
                            <Pagination.First
                                onClick={() => handlePageChange(1)}
                                disabled={currentPage === 1}
                            />
                            <Pagination.Prev
                                onClick={() => handlePageChange(currentPage - 1)}
                                disabled={currentPage === 1}
                            />

                            {/* Display page numbers */}
                            {pageNumbers.map(number => {
                                // Show 5 pages around current page
                                if (
                                    number === 1 ||
                                    number === totalPages ||
                                    (number >= currentPage - 2 && number <= currentPage + 2)
                                ) {
                                    return (
                                        <Pagination.Item
                                            key={number}
                                            active={number === currentPage}
                                            onClick={() => handlePageChange(number)}
                                        >
                                            {number}
                                        </Pagination.Item>
                                    );
                                } else if (
                                    number === currentPage - 3 ||
                                    number === currentPage + 3
                                ) {
                                    return <Pagination.Ellipsis key={number} />;
                                }
                                return null;
                            })}

                            <Pagination.Next
                                onClick={() => handlePageChange(currentPage + 1)}
                                disabled={currentPage === totalPages}
                            />
                            <Pagination.Last
                                onClick={() => handlePageChange(totalPages)}
                                disabled={currentPage === totalPages}
                            />
                        </Pagination>
                    </Col>
                </Row>
            )}
        </Container>
    );
};

export default BeginningBalance;