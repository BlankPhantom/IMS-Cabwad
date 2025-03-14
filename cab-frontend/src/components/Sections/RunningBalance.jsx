import React, { useEffect, useState } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config";
import { Container, Table, Col, Row, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { Pagination } from "react-bootstrap";

const RunningBalance = () => {
  const [runningBalanceData, setRunningBalanceData] = useState([]);
  const [filteredData, setFilteredData] = useState([]);
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth() + 1);
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
  const [remarks, setRemarks] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage] = useState(20);
  const [showAvailableOnly, setShowAvailableOnly] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");

  const fetchRunningBalance = async () => {
    const token = localStorage.getItem("access_token");
    try {
      setLoading(true);
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
          Authorization: `Token ${token}`,
        },
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      const data = await response.json();
      setRunningBalanceData(data);
      setFilteredData(data);
      setCurrentPage(1);
    } catch (err) {
      console.error("Error fetching running balance:", err);
      setError("Failed to load running balance data.");
    } finally {
      setLoading(false);
    }
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
    }

    // Keep "available only" filter if active
    if (showAvailableOnly) {
      filtered = filtered.filter(item => item.itemQuantity > 0);
    }

    // Keep remarks filter if active
    if (remarks) {
      filtered = filtered.filter(item => item.remarks === remarks);
    }

    setFilteredData(filtered);
    setCurrentPage(1);
  };

  const handleRemarksFilter = (event) => {
    const remark = event.target.value;
    setRemarks(remark);

    let filtered = runningBalanceData;

    // Apply remarks filter
    if (remark) {
      filtered = filtered.filter(item => item.remarks === remark);
    }

    // Keep search filter if active
    if (searchTerm) {
      filtered = filtered.filter(
        item =>
          item.itemID.toLowerCase().includes(searchTerm.toLowerCase()) ||
          item.itemName.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }

    // Keep "available only" filter if active
    if (showAvailableOnly) {
      filtered = filtered.filter(item => item.itemQuantity > 0);
    }

    setFilteredData(filtered);
    setCurrentPage(1);
  };

  // Handle month and year change
  const handleMonthYearChange = (month, year) => {
    // Convert month to correct format
    setSelectedMonth(month);
    setSelectedYear(year);
  };

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  // Get current items for the current page
  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = filteredData.slice(indexOfFirstItem, indexOfLastItem);

  // Calculate total pages
  const totalPages = Math.ceil(filteredData.length / itemsPerPage);

  // Generate page numbers
  const pageNumbers = [];
  for (let i = 1; i <= totalPages; i++) {
    pageNumbers.push(i);
  }

  // Fetch data when month/year changes, but only if already initialized
  useEffect(() => {
    fetchRunningBalance();
  }, [selectedMonth, selectedYear]);

  const formatCurrency = (value) => {
    return `₱${parseFloat(value).toLocaleString('en-PH', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2
    })}`;
  };

  const handleAvailableOnlyFilter = (event) => {
    const checked = event.target.checked;
    setShowAvailableOnly(checked);

    // Apply filter based on selection
    if (checked) {
      const filtered = runningBalanceData.filter(item => item.itemQuantity > 0);
      setFilteredData(filtered);
    } else {
      // Reapply any existing filters (search term and remarks)
      let filtered = runningBalanceData;

      if (searchTerm) {
        filtered = filtered.filter(item =>
          item.itemID.toLowerCase().includes(searchTerm.toLowerCase()) ||
          item.itemName.toLowerCase().includes(searchTerm.toLowerCase())
        );
      }

      if (remarks) {
        filtered = filtered.filter(item => item.remarks === remarks);
      }

      setFilteredData(filtered);
    }

    setCurrentPage(1);
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

      {!loading && !error && filteredData.length > 0 && (
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
              {pageNumbers.map((number) => {
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
                      onClick={() => handlePageChange(number)}>
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

export default RunningBalance;