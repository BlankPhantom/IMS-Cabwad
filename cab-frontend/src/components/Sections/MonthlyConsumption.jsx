import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row, Form, Button, Pagination } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { API_ENDPOINTS } from "../../config";
import { saveAs } from "file-saver";

const MonthlyConsumption = () => {
  const [selectedSection, setSelectedSection] = useState("");
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth() + 1);
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear());
  const [sections, setSections] = useState([]);
  const [consumptionData, setConsumptionData] = useState([]);
  const [filteredData, setFilteredData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [conversionProgress, setConversionProgress] = useState(false);

  // Pagination states
  const [currentPage, setCurrentPage] = useState(1);
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
      const filtered = consumptionData.filter(item =>
        Object.values(item).some(value =>
          String(value).toLowerCase().includes(lowercasedTerm)
        )
      );
      setFilteredData(filtered);
    } else {
      setFilteredData(consumptionData);
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

  const fetchMonthlyConsumption = async () => {
    setLoading(true);
    setError(null);
    try {
      const queryParams = new URLSearchParams({
        month: selectedMonth,
        year: selectedYear,
        sectionID: selectedSection,
      });

      if (selectedMonth === 0) {
        const response = await fetch(API_ENDPOINTS.MONTHLY_CONSUMPTION);
        if (!response.ok) {
          throw new Error("Failed to fetch monthly consumption data.");
        }
        const data = await response.json();
        setConsumptionData(data);
      } else {
        const response = await fetch(
          `${API_ENDPOINTS.MONTHLY_CONSUMPTION}?${queryParams}`
        );
        if (!response.ok) {
          throw new Error("Failed to fetch monthly consumption data.");
        }
        const data = await response.json();
        setConsumptionData(data);
      }
      setCurrentPage(1); // Reset to first page when new data is loaded
    } catch (error) {
      console.error("Error fetching monthly consumption:", error);
      setError("Failed to load monthly consumption data.");
    } finally {
      setLoading(false);
    }
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

  // Pagination handler
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
        API_ENDPOINTS.DOWNLOAD_REPORTS(selectedYear, selectedMonth, "pdf"),
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
      const fileName = `Monthly_Report_${selectedYear}_${selectedMonth}.pdf`;
  
      // Save the file
      saveAs(blob, fileName);
  
      alert(`Report downloaded successfully as PDF!`);
    } catch (error) {
      console.error("Error generating the report:", error);
      alert("Failed to generate report. Please try again.");
    } finally {
      setConversionProgress(false); // End progress
    }
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
          <Button className="shadow" onClick={handleGenerateReports} disabled={conversionProgress}>
            {conversionProgress ? "Generating Report..." : "GENERATE MONTHLY REPORT"}
          </Button>
        </Col>
      </Row>
  
      {conversionProgress && (
        <Row>
          <Col className="d-flex justify-content-center mt-3">
            <div className="spinner-border text-primary" role="status">
              <span className="sr-only">Loading...</span>
            </div>
          </Col>
        </Row>
      )}
  
      <Row>
        <Table responsive bordered striped hover className="tableStyle mt-3">
          <thead>
            <tr>
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
                <td colSpan="7" className="text-center">
                  Loading data...
                </td>
              </tr>
            ) : error ? (
              <tr>
                <td colSpan="7" className="text-center text-danger">
                  {error}
                </td>
              </tr>
            ) : currentItems.length > 0 ? (
              currentItems.map((item, index) => (
                <tr key={index}>
                  <td>{item.date}</td>
                  <td>{item.week}</td>
                  <td>{item.itemID}</td>
                  <td>{item.itemName}</td>
                  <td>{item.consumption}</td>
                  <td>₱{item.cost}</td>
                  <td>₱{item.total}</td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="7" className="text-center">
                  No records found.
                </td>
              </tr>
            )}
          </tbody>
        </Table>
      </Row>
  
      {/* Pagination */}
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
export default MonthlyConsumption;