import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom"; // Import useNavigate
import { API_ENDPOINTS } from "../../config";
import {
  Table,
  Container,
  Spinner,
  Alert,
  Button,
  Row,
  Col,
  Pagination,
} from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowLeft, faArrowRight } from "@fortawesome/free-solid-svg-icons";
import MonthYearPicker from "../MonthYearPicker";

const TransactionHistory = () => {
  const { itemID, itemName } = useParams();
  const navigate = useNavigate();
  const [selectedMonthYear, setSelectedMonthYear] = useState({
    month: new Date().getMonth(), // Default to current month
    year: new Date().getFullYear(), // Default to current year
  });
  const [products, setProducts] = useState([]);
  const [transactionDetails, setTransactionDetails] = useState({});
  const [groupedData, setGroupedData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Pagination states
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [itemsPerPage] = useState(20);

  // Fetch all transaction details once
  const fetchTransactionDetails = async () => {
    try {
      const token = localStorage.getItem("access_token");
      if (!token) {
        throw new Error("No authentication token found");
      }

      const response = await fetch(API_ENDPOINTS.TRANSACTION_LIST, {
        method: "GET",
        headers: {
          Authorization: `Token ${token}`,
          "Content-Type": "application/json",
        },
      });

      if (!response.ok) {
        throw new Error(
          "Failed fetching transaction details: " + response.statusText
        );
      }

      const data = await response.json();
      const results = data.results || data;

      // Convert array to a map with transactionID as key for faster lookup
      const detailsMap = {};
      results.forEach((detail) => {
        detailsMap[detail.transactionDetailsID] = detail;
      });

      setTransactionDetails(detailsMap);
      return detailsMap;
    } catch (error) {
      console.error("Error fetching transaction details:", error);
      return {};
    }
  };

  // Fetch products for this specific itemID
  const fetchProductHistory = async (page = 1) => {
    try {
      const token = localStorage.getItem("access_token");
      if (!token) {
        throw new Error("No authentication token found");
      }

      const queryParams = new URLSearchParams({
        month: selectedMonthYear.month + 1,
        year: selectedMonthYear.year,
        itemID: itemID,
        page,
      });

      const url = `${
        API_ENDPOINTS.TRANSACTION_HISTORY
      }?${queryParams.toString()}`;
      console.log("Fetching from:", url);

      const response = await fetch(url, {
        headers: {
          Authorization: `Token ${token}`,
          "Content-Type": "application/json",
        },
      });

      if (!response.ok) {
        const errorText = await response.text();
        throw new Error(`API Error ${response.status}: ${errorText}`);
      }

      const data = await response.json();
      console.log("Received product data:", data);

      setTotalPages(Math.ceil(data.count / itemsPerPage));
      setCurrentPage(page);

      return data.results || data;
    } catch (err) {
      console.error("Fetch error details:", err);
      throw err;
    }
  };

  // Combine product and transaction details data
  const combineData = (products, detailsMap) => {
    // Group products by transactionDetailsID
    const groupedByTransaction = {};

    products.forEach((product) => {
      const detailsID = product.transactionDetailsID;

      if (!groupedByTransaction[detailsID]) {
        groupedByTransaction[detailsID] = {
          transactionDetailsID: detailsID,
          // Get transaction details from the map
          ...detailsMap[detailsID],
          products: [],
        };
      }

      groupedByTransaction[detailsID].products.push(product);
    });

    return Object.values(groupedByTransaction);
  };

  // Load all data
  const loadAllData = async (page = 1) => {
    try {
      setLoading(true);

      // Fetch both datasets concurrently
      const [detailsMap, productsData] = await Promise.all([
        fetchTransactionDetails(),
        fetchProductHistory(page),
      ]);

      setProducts(productsData);

      // Combine the data
      const combined = combineData(productsData, detailsMap);
      setGroupedData(combined);
    } catch (err) {
      setError(err.message || "Failed to load transaction history");
    } finally {
      setLoading(false);
    }
  };

  const handleMonthYearChange = (month, year) => {
    setLoading(true);
    setSelectedMonthYear({
      month,
      year,
    });

    setTimeout(() => {
      setLoading(false);
    }, 500);
  };

  const paginate = (pageNumber) => {
    if (pageNumber >= 1 && pageNumber <= totalPages) {
      loadAllData(pageNumber);
    }
  };

  const renderPaginationItems = () => {
    const pageNumbers = [];
    const totalPagesToShow = 5;
    let startPage, endPage;

    if (totalPages <= totalPagesToShow) {
      startPage = 1;
      endPage = totalPages;
    } else {
      if (currentPage <= Math.ceil(totalPagesToShow / 2)) {
        startPage = 1;
        endPage = totalPagesToShow;
      } else if (currentPage + Math.floor(totalPagesToShow / 2) >= totalPages) {
        startPage = totalPages - totalPagesToShow + 1;
        endPage = totalPages;
      } else {
        startPage = currentPage - Math.floor(totalPagesToShow / 2);
        endPage = currentPage + Math.floor(totalPagesToShow / 2);
      }
    }

    if (startPage > 1) {
      pageNumbers.push(
        <Pagination.Item key="first" onClick={() => paginate(1)}>
          1
        </Pagination.Item>
      );
      if (startPage > 2) {
        pageNumbers.push(<Pagination.Ellipsis key="first-ellipsis" />);
      }
    }

    for (let i = startPage; i <= endPage; i++) {
      pageNumbers.push(
        <Pagination.Item
          key={i}
          active={i === currentPage}
          onClick={() => paginate(i)}>
          {i}
        </Pagination.Item>
      );
    }

    if (endPage < totalPages) {
      if (endPage < totalPages - 1) {
        pageNumbers.push(<Pagination.Ellipsis key="last-ellipsis" />);
      }
      pageNumbers.push(
        <Pagination.Item key="last" onClick={() => paginate(totalPages)}>
          {totalPages}
        </Pagination.Item>
      );
    }

    return pageNumbers;
  };

  useEffect(() => {
    loadAllData();
  }, [selectedMonthYear, itemID]);

  const formatCurrency = (value) => {
    return `₱${parseFloat(value).toLocaleString("en-PH", {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })}`;
  };

  return (
    <Container
      style={{ width: "100%" }}
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
          }}>
          Transaction History for {itemName} {itemID}
        </h3>
      </Row>
      <Row className="mt-3 d-flex align-items-center justify-content-between">
        <Col>
          <MonthYearPicker
            onMonthYearChange={handleMonthYearChange}
            initialMonth={selectedMonthYear.month}
            initialYear={selectedMonthYear.year}
            allowAllMonths={true}
          />
        </Col>
      </Row>
      {loading ? (
        <div className="text-center mt-4">
          <Spinner animation="border" />
          <p>Loading transactions...</p>
        </div>
      ) : error ? (
        <Alert variant="danger">{error}</Alert>
      ) : (
        <Table id="TtableStyle" responsive bordered striped hover className="tableStyle mt-3">
          <thead className="sticky-header">
            <tr>
              <th>Date</th>
              <th>Week</th>
              <th>MRIS/DR</th>
              <th>Supplier</th>
              <th>
                Requested <br /> By
              </th>
              <th>Section</th>
              <th>Purpose</th>
              <th>Item ID</th>
              <th>Product Name</th>
              <th>Area</th>
              <th>
                Purchased From <br /> Supplier
              </th>
              <th>
                Return to <br /> Supplier
              </th>
              <th>
                Transfer from <br /> Other Warehouse
              </th>
              <th>
                Transfer to <br /> Other Warehouse
              </th>
              <th>
                Issued <br /> Qty.
              </th>
              <th>
                Returned <br /> Qty.
              </th>
              <th>Consumption</th>
              <th>Cost</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            {groupedData.length > 0 ? (
              groupedData.map((transaction, tIndex) => (
                <React.Fragment key={tIndex}>
                  <tr>
                    <td rowSpan={transaction.products?.length + 1 || 2}>
                      {transaction.date}
                    </td>
                    <td rowSpan={transaction.products?.length + 1 || 2}>
                      {transaction.week}
                    </td>
                    <td rowSpan={transaction.products?.length + 1 || 2}>
                      {transaction.mris}
                    </td>
                    <td rowSpan={transaction.products?.length + 1 || 2}>
                      {transaction.supplier}
                    </td>
                    <td rowSpan={transaction.products?.length + 1 || 2}>
                      {transaction.requestedBy}
                    </td>
                    <td rowSpan={transaction.products?.length + 1 || 2}>
                      {transaction.section || transaction.sectionName}
                    </td>
                    <td rowSpan={transaction.products?.length + 1 || 2}>
                      {transaction.purpose || transaction.purposeName}
                    </td>
                  </tr>
                  {transaction.products?.length > 0 ? (
                    transaction.products.map((product, pIndex) => (
                      <tr key={`${transaction.transactionDetailsID}-${pIndex}`}>
                        <td>{product.itemID}</td>
                        <td>{product.itemName}</td>
                        <td>{product.areaName}</td>
                        <td>{product.purchasedFromSupp}</td>
                        <td>{product.returnToSupplier}</td>
                        <td>{product.transferFromWH}</td>
                        <td>{product.transferToWH}</td>
                        <td>{product.issuedQty}</td>
                        <td>{product.returnedQty}</td>
                        <td>{product.consumption}</td>
                        <td>{formatCurrency(product.cost)}</td>
                        <td>{formatCurrency(product.total)}</td>
                      </tr>
                    ))
                  ) : (
                    <tr>
                      <td colSpan="12" className="text-center text-muted">
                        No products found
                      </td>
                    </tr>
                  )}
                </React.Fragment>
              ))
            ) : (
              <tr>
                <td colSpan="19" className="text-center">
                  No transactions found for item {itemName} - {itemID} 
                </td>
              </tr>
            )}
          </tbody>
        </Table>
      )}
      {!loading && !error && totalPages > 1 && (
        <Row>
          <Col className="d-flex justify-content-center mt-3">
            <Pagination>
              <Pagination.First
                onClick={() => paginate(1)}
                disabled={currentPage === 1}
              />
              <Pagination.Prev
                onClick={() => paginate(currentPage - 1)}
                disabled={currentPage === 1}
              />

              {renderPaginationItems()}

              <Pagination.Next
                onClick={() => paginate(currentPage + 1)}
                disabled={currentPage === totalPages}
              />
              <Pagination.Last
                onClick={() => paginate(totalPages)}
                disabled={currentPage === totalPages}
              />
            </Pagination>
          </Col>
        </Row>
      )}
    </Container>
  );
};

export default TransactionHistory;