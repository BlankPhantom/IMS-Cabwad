import React, { useState, useEffect } from "react";
import "../table.css";
import {
  Container,
  Table,
  Col,
  Row,
  Form,
  Button,
  Pagination,
} from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { API_ENDPOINTS } from "../../config";
import { saveAs } from "file-saver";

const MonthlyConsumption = () => {
  const [selectedSection, setSelectedSection] = useState("");
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
  const [sections, setSections] = useState([]);
  const [consumptionData, setConsumptionData] = useState([]);
  const [currentItems, setCurrentItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [conversionProgress, setConversionProgress] = useState(false);

  // Pagination states
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalItems, setTotalItems] = useState(0);
  const [itemsPerPage] = useState(20);

  useEffect(() => {
    fetchSections();
    fetchMonthlyConsumption();
  }, []);

  useEffect(() => {
    fetchMonthlyConsumption();
  }, [selectedMonth, selectedYear, selectedSection]);

  // Search effect to filter data
  useEffect(() => {
    if (searchTerm) {
      const lowercasedTerm = searchTerm.toLowerCase();
      const filtered = consumptionData.filter((item) =>
        Object.values(item).some((value) =>
          String(value).toLowerCase().includes(lowercasedTerm)
        )
      );
      setCurrentItems(filtered);
      setTotalPages(Math.ceil(filtered.length / itemsPerPage));
    } else {
      setCurrentItems(consumptionData);
      setTotalPages(Math.ceil(consumptionData.length / itemsPerPage));
    }
    setCurrentPage(1); // Reset to first page when search filter changes
  }, [searchTerm, consumptionData]);

  // Fetch sections for the dropdown
  const fetchSections = async () => {
    try {
      const response = await fetch(API_ENDPOINTS.SECTION_LIST);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setSections(data);
    } catch (error) {
      console.error("Error fetching sections:", error);
    }
  };

  const fetchMonthlyConsumption = async (page = 1) => {
    setLoading(true);
    setError(null);
    try {
      const queryParams = new URLSearchParams({
        month: selectedMonth + 1, // Add 1 to convert from 0-indexed to 1-indexed
        year: selectedYear,
        sectionID: selectedSection,
        page,
      });

      const response = await fetch(
        `${API_ENDPOINTS.MONTHLY_CONSUMPTION}?${queryParams}`
      );
      if (!response.ok) {
        throw new Error("Failed to fetch monthly consumption data.");
      }
      const data = await response.json();
      // DRF Pagination structure
      setConsumptionData(data.results);
      setCurrentItems(data.results);
      setTotalPages(Math.ceil(data.count / itemsPerPage));
      setTotalItems(data.count);
      setCurrentPage(page);
      updateMonthlyState(data, page);
    } catch (error) {
      console.error("Error fetching monthly consumption:", error);
      setError("Failed to load monthly consumption data.");
    } finally {
      setLoading(false);
    }
  };

  const updateMonthlyState = (data, page) => {
    setConsumptionData(data.results);
    setCurrentItems(data.results);
    setTotalPages(Math.ceil(data.count / itemsPerPage));
    setTotalItems(data.count);
    setCurrentPage(page);
};

  // Handle Section Change
  const handleSectionChange = (event) => {
    setSelectedSection(event.target.value);
  };

  // Handle Month-Year Change
  const handleMonthYearChange = (month, year) => {
    setSelectedMonth(month);
    setSelectedYear(year);
  };

  // Handle Search Input Change
  const handleSearchChange = (event) => {
    setSearchTerm(event.target.value);
  };

  // pagination
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

  const handleGenerateReports = async () => {
    try {
      setConversionProgress(true); // Start progress
      const token = localStorage.getItem("access_token");
      if (!token) {
        alert("Authorization token is missing. Please log in again.");
        setConversionProgress(false); // End progress
        return;
      }

      // Fetch the report from API (modify endpoint based on file type)
      const response = await fetch(
        API_ENDPOINTS.DOWNLOAD_REPORTS(selectedYear, selectedMonth+1, "docx"),
        {
          method: "GET",
          headers: {
            Authorization: `Token ${token}`,
          },
        }
      );

      if (!response.ok) {
        throw new Error("Failed to fetch the report.");
      }

      // Convert response to Blob
      const blob = await response.blob();

      // Determine file name & extension
      const fileName = `Monthly_Report_${selectedYear}_${selectedMonth+1}.docx`;

      // Save the file
      saveAs(blob, fileName);

      alert(`Report downloaded successfully as DOCX!`);
    } catch (error) {
      console.error("Error generating the report:", error);
      alert("Failed to generate report. Please try again.");
    } finally {
      setConversionProgress(false); // End progress
    }
  };

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
      className="d-flex flex-column justify-content-center mt-5">
      <Row className="sectionTitle">
        <Col>
          <h2 style={{ fontWeight: "650" }}>Monthly Consumption</h2>
        </Col>
      </Row>

      <Row className="mt-3 d-flex align-items-center justify-content-between">
        <Col md={6}>
          <MonthYearPicker onMonthYearChange={handleMonthYearChange} />
        </Col>
        <Col md={4}>
          <Form.Group controlId="sectionSelect">
            <Form.Select
              name="section"
              value={selectedSection}
              onChange={handleSectionChange}>
              <option value="">All Sections</option>
              {sections.map((section) => (
                <option key={section.sectionID} value={section.sectionID}>
                  {section.sectionName}
                </option>
              ))}
            </Form.Select>
          </Form.Group>
        </Col>
      </Row>

      <Row>
        <Col className="d-flex justify-content-end mt-4">
          <input
            type="search"
            className="form-control"
            placeholder="Search"
            value={searchTerm}
            onChange={handleSearchChange}
            style={{ width: "300px" }}
          />
        </Col>
      </Row>

      <Row>
        <Col className="d-flex justify-content-center mt-3">
          <Button
            className="shadow"
            onClick={handleGenerateReports}
            disabled={conversionProgress}>
            {conversionProgress
              ? "Generating Report..."
              : "GENERATE MONTHLY REPORT"}
          </Button>
        </Col>
      </Row>

      {conversionProgress && (
        <>
          <Row>
            <Col className="d-flex justify-content-center mt-3">
              <div className="spinner-border text-primary" role="status"></div>
            </Col>
          </Row>
          <Row>
            <Col className="d-flex justify-content-center">
              <span className="text-muted">
                Generating report, please wait...
              </span>
            </Col>
          </Row>
        </>
      )}

      <Row>
        <Table responsive bordered striped hover className="tableStyle mt-3">
          <thead>
            <tr>
              <th>Section</th>
              <th>Date</th>
              <th>Week</th>
              <th>Item ID</th>
              <th>Product Name</th>
              <th>Consumption</th>
              <th>Cost</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td colSpan="8" className="text-center">
                  Loading data...
                </td>
              </tr>
            ) : error ? (
              <tr>
                <td colSpan="8" className="text-center text-danger">
                  {error}
                </td>
              </tr>
            ) : currentItems.length > 0 ? (
              currentItems.map((item, index) => (
                <tr key={index}>
                  <td>{item.sectionName}</td>
                  <td>{item.date}</td>
                  <td>{item.week}</td>
                  <td>{item.itemID}</td>
                  <td>{item.itemName}</td>
                  <td>{item.consumption}</td>
                  <td>{formatCurrency(item.cost)}</td>
                  <td>{formatCurrency(item.total)}</td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="8" className="text-center">
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
export default MonthlyConsumption;
