import React, { useEffect, useState } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config";
import { Container, Table, Col, Row, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { Pagination } from "react-bootstrap";

const RunningBalance = () => {
  const [runningBalanceData, setRunningBalanceData] = useState([]);
  const [currentItems, setCurrentItems] = useState([]);
  const [selectedMeasurement, setSelectedMeasurement] = useState("");
  const [measurements, setMeasurements] = useState([]);
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
  const [remarks, setRemarks] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showAvailableOnly, setShowAvailableOnly] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");

  // Pagination states
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalItems, setTotalItems] = useState(0);
  const [itemsPerPage] = useState(20);

  //fetch measurements
  const fetchMeasurements = async () => {
    const token = localStorage.getItem("access_token");
    setLoading(true);

    try {
      const response = await fetch(API_ENDPOINTS.MEASUREMENTS_LIST, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`,
        },
      });
      if (!response) {
        throw new Error("fetching measurement failed ");
      }
      const data = await response.json();
      setMeasurements(data);
    } catch (e) {
      console.error("Error fetching measurements:", e);
    }
  };

  // Build common query params for all API calls
  const buildQueryParams = (page = 1) => {
    const queryParams = new URLSearchParams({
      month: selectedMonth + 1,
      year: selectedYear,
      page,
    });

    if (selectedMeasurement && selectedMeasurement !== "0") {
      queryParams.append("measurementID", selectedMeasurement);
    }

    if (remarks && remarks !== "") {
      queryParams.append("remarks", remarks);
    }

    // Add available_only parameter if filter is active
    if (showAvailableOnly) {
      queryParams.append("available_only", "true");
    }

    return queryParams;
  };

  const fetchRunningBalance = async (page = 1) => {
    const token = localStorage.getItem("access_token");
    try {
      setLoading(true);

      const queryParams = buildQueryParams(page);
      const url = `${API_ENDPOINTS.RUNNING_BAL_LIST}?${queryParams}`;

      const response = await fetch(url, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`,
        },
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      const data = await response.json();
      // DRF Pagination structure
      updateRunningState(data, page);
    } catch (err) {
      console.error("Error fetching running balance:", err);
      setError("Failed to load running balance data.");
    } finally {
      setLoading(false);
    }
  };

  const updateRunningState = (data, page) => {
    setRunningBalanceData(data.results);
    setCurrentItems(data.results);
    setTotalPages(Math.ceil(data.count / itemsPerPage));
    setTotalItems(data.count);
    setCurrentPage(page);
  };

  // Handle search functionality
  const handleSearch = (event) => {
    const term = event.target.value;
    setSearchTerm(term);
    setCurrentPage(1); // Reset to first page when searching
  };

  // Perform search with current filters
  const performSearch = async (term, page = 1) => {
    try {
      const token = localStorage.getItem("access_token");

      const queryParams = buildQueryParams(page);

      // Add search term if present
      if (term.trim()) {
        queryParams.append("search", term.trim());
      }

      const endpoint = term.trim()
        ? API_ENDPOINTS.RUNNING_BAL_SEARCH
        : API_ENDPOINTS.RUNNING_BAL_LIST;

      const response = await fetch(
        `${endpoint}?${queryParams}`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Token ${token}`,
          },
        }
      );

      if (!response.ok) {
        throw new Error("Search failed");
      }

      const data = await response.json();
      updateRunningState(data, page);
    } catch (error) {
      console.error("Search failed", error);
      setError("Failed to search running balance data.");
    } finally {
      setLoading(false);
    }
  };

  const handleRemarksFilter = (event) => {
    const remark = event.target.value;
    setRemarks(remark);
    setCurrentPage(1); // Reset to first page when filter changes
  };

  const handleAvailableOnlyFilter = (event) => {
    const checked = event.target.checked;
    setShowAvailableOnly(checked);
    setCurrentPage(1); // Reset to first page when filter changes
  };

  // Handle month and year change
  const handleMonthYearChange = (month, year) => {
    setSelectedMonth(month);
    setSelectedYear(year);
    setCurrentPage(1); // Reset to first page when date changes
  };

  // Single useEffect to handle all filter changes
  useEffect(() => {
    performSearch(searchTerm, currentPage);
  }, [
    selectedMonth,
    selectedYear,
    selectedMeasurement,
    remarks,
    showAvailableOnly,
    searchTerm,
    currentPage,
  ]);

  // Initial setup
  useEffect(() => {
    fetchMeasurements();
  }, []);

  const formatCurrency = (value) => {
    return `₱${parseFloat(value).toLocaleString("en-PH", {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })}`;
  };

  const handleMeasurementChange = (event) => {
    setSelectedMeasurement(event.target.value);
    setCurrentPage(1); // Reset to first page when filter changes
  };

  const paginate = (pageNumber) => {
    if (pageNumber >= 1 && pageNumber <= totalPages) {
      setCurrentPage(pageNumber);
    }
  };

  // Render pagination items
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

    // First page button
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

    // Page number buttons
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

    // Last page button
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

  return (
    <Container
      style={{ width: "100%" }}
      fluid
      className="d-flex flex-column justify-content-center mt-2">
      <Row className="sectionTitle">
        <Col>
          <h2 className="mt-5" style={{ fontWeight: "650" }}>
            Running Balance
          </h2>
        </Col>
      </Row>

      <Row className="mt-2 align-items-center">
        <Col
          className="d-flex justify-contents-start align-items-center"
          xs="auto">
          <MonthYearPicker
            onMonthYearChange={handleMonthYearChange}
            initialMonth={selectedMonth}
            initialYear={selectedYear}
          />

          <Form.Select
            value={selectedMeasurement}
            onChange={handleMeasurementChange}
            style={{
              width: "175px",
              height: "31px",
              padding: "3px",
              borderRadius: "4px",
              border: ".5px solid rgb(212, 212, 212)",
              marginLeft: "10px",
              marginTop: "1px",
            }}>
            <option value="0">All Measurements</option>
            {measurements.map((measurement) => (
              <option
                key={measurement.measurementID}
                value={measurement.measurementID}>
                {measurement.measureName}
              </option>
            ))}
          </Form.Select>
          <Form.Select
            className="form-select"
            style={{
              width: "130px",
              height: "31px",
              padding: "3px",
              borderRadius: "4px",
              border: ".5px solid rgb(212, 212, 212)",
              marginLeft: "10px",
            }}
            value={remarks}
            onChange={handleRemarksFilter}>
            <option value="">All Remarks</option>
            <option value="Non-Moving">Non-Moving</option>
            <option value="Slow Moving">Slow Moving</option>
            <option value="Fast Moving">Fast Moving</option>
          </Form.Select>
        </Col>
        <Col xs="auto">
          <Form.Check
            type="checkbox"
            id="available-only"
            label="With Available Stocks"
            checked={showAvailableOnly}
            onChange={handleAvailableOnlyFilter}
          />
        </Col>
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
        <Table
          responsive
          bordered
          striped
          hover
          id="TtableStyle"
          className="tableStyle mt-3">
          <thead>
            <tr>
              <th>Item ID</th>
              <th>Product Name</th>
              <th>
                Unit of <br /> Measurement
              </th>
              <th>Beginning <br /> Balance</th>
              <th>
                Purchased <br /> from <br /> Supplier
              </th>
              <th>Return to <br /> Supplier</th>
              <th>
                Transfer <br /> From <br /> Other <br /> Warehouse
              </th>
              <th>
                Transfer <br /> to <br /> Other <br /> Warehouse
              </th>
              <th>Issued <br /> Qty.</th>
              <th>Returned <br /> Qty.</th>
              <th>Consumption</th>
              <th>Available <br /> Stocks</th>
              <th>Cost</th>
              <th>Total</th>
              <th>Remarks</th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td colSpan="15" className="text-center">
                  Loading data...
                </td>
              </tr>
            ) : error ? (
              <tr>
                <td colSpan="15" className="text-center text-danger">
                  {error}
                </td>
              </tr>
            ) : currentItems.length > 0 ? (
              currentItems.map((item, index) => (
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
                  <td
                    style={{
                      color:
                        item.itemQuantity <= item.beginningBalance * 0.1
                          ? "red"
                          : item.itemQuantity >= item.beginningBalance
                            ? "green"
                            : "",
                    }}>
                    {item.itemQuantity}
                  </td>
                  <td>{formatCurrency(item.unitCost)}</td>
                  <td>{formatCurrency(item.totalCost)}</td>
                  <td>{item.remarks}</td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="15" className="text-center">
                  {searchTerm
                    ? `No results found for "${searchTerm}"`
                    : "No records found."}
                </td>
              </tr>
            )}
          </tbody>
        </Table>
      </Row>

      {/* Pagination */}
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

export default RunningBalance;