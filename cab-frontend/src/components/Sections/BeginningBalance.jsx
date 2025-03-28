import React, { useState, useEffect } from "react";
import { API_ENDPOINTS } from "../../config.js";
import "../table.css";
import { Container, Table, Col, Row, Pagination, Form } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const BeginningBalance = () => {
  const [items, setItems] = useState([]);
  const [currentItems, setCurrentItems] = useState([]);
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
  const [selectedMeasurement, setSelectedMeasurement] = useState("");
  const [measurements, setMeasurements] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
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
            method: 'GET',
            headers: {
                "Content-Type": "application/json",
                'Authorization': `Token ${token}`
            }
        })
        if(!response){
            throw new Error("fetching measurement failed ");
        }
        const data = await response.json();
        setMeasurements(data)
    } catch(e) {
        console.error("Error fetching measurements:", e);
    }
  }
    
  // Search functionality
  const fetchItems = async (page = 1) => {
    const token = localStorage.getItem("access_token");
    setLoading(true);

    try {
      const queryParams = new URLSearchParams({
        month: selectedMonth + 1,
        year: selectedYear,
        page,
      });

      // Only append measurementID if it's not "0"
      if (selectedMeasurement !== "0") {
        queryParams.append("measurementID", selectedMeasurement);
      }

      const response = await fetch(
        `${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`,
        {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Token ${token}`,
          },
        }
      );

      if (!response.ok) {
        throw new Error("Failed to fetch beginning balance data");
      }

      const data = await response.json();

      // If no data exists, create new entries
      if (data.results.length === 0) {
        await fetch(API_ENDPOINTS.BEGINNING_BAL_CREATE, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Token ${token}`,
          },
        });

        // Refetch after creating
        const recreatedResponse = await fetch(
          `${API_ENDPOINTS.BEGINNING_BAL_LIST}?${queryParams}`,
          {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Token ${token}`,
            },
          }
        );

        const recreatedData = await recreatedResponse.json();
        updateItemsState(recreatedData, page);
      } else {
        updateItemsState(data, page);
      }
    } catch (error) {
      console.error("Error in fetch items:", error);
      setError("Failed to load beginning balance data.");
    } finally {
      setLoading(false);
    }
  };

  const updateItemsState = (data, page) => {
    setItems(data.results);
    setCurrentItems(data.results);
    setTotalPages(Math.ceil(data.count / itemsPerPage));
    setTotalItems(data.count);
    setCurrentPage(page);
  };

  const handleSearch = (event) => {
    const term = event.target.value;
    setSearchTerm(term);

    if (!term) {
      // Reset to first page of all items
      fetchItems(1);
      return;
    }

    const filtered = items.filter(
      (item) =>
        item.itemID.toString().toLowerCase().includes(term) ||
        item.itemName.toLowerCase().includes(term)
    );

    setCurrentItems(filtered);
    setCurrentPage(1); // Reset to first page when search filter changes
    setTotalPages(Math.ceil(filtered.length / itemsPerPage));
  };

  const handleMeasurementChange = (event) => {
    setSelectedMeasurement(event.target.value);
    console.log(selectedMeasurement)
  };
  // Month and Year change handler
  const handleMonthYearChange = (month, year) => {
    setLoading(true);

    setSelectedMonth(month);
    setSelectedYear(year);
  };

  const paginate = (pageNumber) => {
    if (pageNumber >= 1 && pageNumber <= totalPages) {
      fetchItems(pageNumber);
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

  useEffect(() => {
    fetchItems(currentPage);
    fetchMeasurements();
  }, [selectedMonth, selectedYear, selectedMeasurement]);

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
      <Row className="sectionTitle">
        <Col>
          <h2 className="mt-5" style={{ fontWeight: "650" }}>
            Beginning Balance
          </h2>
        </Col>
      </Row>

      <Row className="d-flex justify-content-center align-items-center mt-3">
        <Col className="d-flex justify-content-start">
          <MonthYearPicker onMonthYearChange={handleMonthYearChange} />
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
            marginTop: "1px"
          }}>
            <option value="0">All Measurements</option>
            {measurements.map((measurement) => (
              <option key={measurement.measurementID} value={measurement.measurementID}>
                {measurement.measureName}
              </option>
            ))}
          </Form.Select>
        </Col>
        <Col className="d-flex justify-content-end">
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
              <th>
                Product <br /> Name
              </th>
              <th>
                Unit of <br /> Measurement
              </th>
              <th>Available Stocks</th>
              <th>
                Average Unit <br /> Cost
              </th>
              <th>
                Total Cost of <br /> Available Stocks
              </th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td colSpan="6" className="text-center">
                  Loading data...
                </td>
              </tr>
            ) : error ? (
              <tr>
                <td colSpan="6" className="text-center text-danger">
                  {error}
                </td>
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
                <td colSpan="6" className="text-center">
                  No records found.
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

export default BeginningBalance;
