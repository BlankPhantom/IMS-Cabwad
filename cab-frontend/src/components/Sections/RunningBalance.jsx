import React, { useEffect, useState } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config";
import { Container, Table, Col, Row, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { Pagination } from "react-bootstrap";

const RunningBalance = () => {
  const [runningBalanceData, setRunningBalanceData] = useState([]);
  const [currentItems, setCurrentItems] = useState([]);
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

  const fetchRunningBalance = async (page=1) => {
    const token = localStorage.getItem("access_token");
    try {
      setLoading(true);

      const queryParams = new URLSearchParams({
        month: selectedMonth + 1,
        year: selectedYear,
        page,
      });

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
      setRunningBalanceData(data.results);
      setCurrentItems(data.results);
      setTotalPages(Math.ceil(data.count / itemsPerPage));
      setTotalItems(data.count);
      setCurrentPage(page);
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
    const term = event.target.value.toLowerCase();
    setSearchTerm(term);

    let filtered = runningBalanceData;

    // Apply search filter
    if (term) {
      filtered = filtered.filter(
        (item) =>
          item.itemID.toLowerCase().includes(term) ||
          item.itemName.toLowerCase().includes(term)
      );
    } else if (!term) {
      // Reset to first page of all items
      fetchItems(1);
      return;
    }

    // Keep "available only" filter if active
    if (showAvailableOnly) {
      filtered = filtered.filter((item) => item.itemQuantity > 0);
    }

    // Keep remarks filter if active
    if (remarks) {
      filtered = filtered.filter((item) => item.remarks === remarks);
    }

    setCurrentItems(filtered);
    setCurrentPage(1);
    setTotalPages(Math.ceil(filtered.length / itemsPerPage));
  };

  const handleRemarksFilter = (event) => {
    const remark = event.target.value;
    setRemarks(remark);

    let filtered = runningBalanceData;

    // Apply remarks filter
    if (remark) {
      filtered = filtered.filter((item) => item.remarks === remark);
    }

    // Keep search filter if active
    if (searchTerm) {
      filtered = filtered.filter(
        (item) =>
          item.itemID.toLowerCase().includes(searchTerm.toLowerCase()) ||
          item.itemName.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }

    // Keep "available only" filter if active
    if (showAvailableOnly) {
      filtered = filtered.filter((item) => item.itemQuantity > 0);
    }

    setCurrentItems(filtered);
    setCurrentPage(1);
    setTotalPages(Math.ceil(filtered.length / itemsPerPage));
  };

  // Handle month and year change
  const handleMonthYearChange = (month, year) => {
    setSelectedMonth(month);
    setSelectedYear(year);
  };

  // Fetch data when month/year changes, but only if already initialized
  useEffect(() => {
    fetchRunningBalance();
  }, [selectedMonth, selectedYear]);

  const formatCurrency = (value) => {
    return `₱${parseFloat(value).toLocaleString("en-PH", {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })}`;
  };

  const handleAvailableOnlyFilter = (event) => {
    const checked = event.target.checked;
    setShowAvailableOnly(checked);

    // Apply filter based on selection
    if (checked) {
      const filtered = runningBalanceData.filter(
        (item) => item.itemQuantity > 0
      );
      setCurrentItems(filtered);
    } else {
      // Reapply any existing filters (search term and remarks)
      let filtered = runningBalanceData;

      if (searchTerm) {
        filtered = filtered.filter(
          (item) =>
            item.itemID.toLowerCase().includes(searchTerm.toLowerCase()) ||
            item.itemName.toLowerCase().includes(searchTerm.toLowerCase())
        );
      }

      if (remarks) {
        filtered = filtered.filter((item) => item.remarks === remarks);
      }

      setCurrentItems(filtered);
      setTotalPages(Math.ceil(filtered.length / itemsPerPage));
    }

    setCurrentPage(1);
    
  };

  const paginate = (pageNumber) => {
    if (pageNumber >= 1 && pageNumber <= totalPages) {
        fetchRunningBalance(pageNumber);
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
                  onClick={() => paginate(i)}
              >
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
        <Col className="d-flex align-items-center">
          <Form.Select
            className="form-select"
            style={{ width: "300px" }}
            value={remarks}
            onChange={handleRemarksFilter}>
            <option value="">All</option>
            <option value="Non-Moving">Non-Moving</option>
            <option value="Slow Moving">Slow Moving</option>
            <option value="Fast Moving">Fast Moving</option>
          </Form.Select>
          <Form.Check
            type="checkbox"
            id="available-only"
            label="With Available Stocks"
            checked={showAvailableOnly}
            onChange={handleAvailableOnlyFilter}
            className="ms-3 d-flex align-items-center"
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
              <th>Beginning Balance</th>
              <th>
                Purchased from <br /> Supplier
              </th>
              <th>Return to Supplier</th>
              <th>
                Transfer From <br /> Other Warehouse
              </th>
              <th>
                Transfer to <br /> Other Warehouse
              </th>
              <th>Issued Qty.</th>
              <th>Returned Qty.</th>
              <th>Consumption</th>
              <th>Available Stocks</th>
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
