import React, { useState, useEffect } from "react";
import "../table.css";
import { Container, Table, Col, Row, Form, Button, Pagination } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";
import { API_ENDPOINTS } from "../../config";
import { saveAs } from "file-saver";

const MonthlyConsumption = () => {
  const [selectedSection, setSelectedSection] = useState("");
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth());
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
        month: selectedMonth + 1, // Add 1 to convert from 0-indexed to 1-indexed
        year: selectedYear,
        sectionID: selectedSection,
      });

      const response = await fetch(
        `${API_ENDPOINTS.MONTHLY_CONSUMPTION}?${queryParams}`
      );
      if (!response.ok) {
        throw new Error("Failed to fetch monthly consumption data.");
      }
      const data = await response.json();
      setConsumptionData(data);

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
        API_ENDPOINTS.DOWNLOAD_REPORTS(selectedYear, selectedMonth, "docx"),
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
      const fileName = `Monthly_Report_${selectedYear}_${selectedMonth}.docx`;

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
    return `₱${parseFloat(value).toLocaleString('en-PH', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2
    })}`;
  };
  return (
    <Container
      style={{ width: "100%" }}
      fluid
      className="d-flex flex-column justify-content-center mt-5">
      <Row className="g-3 align-items-center">
        <Col xs={12} className="text-center">
          <h2 className="mb-2" style={{ fontWeight: '650' }}>Monthly Consumption</h2>
        </Col>

        <Col xs={12} className="text-center mb-2">
          <Button
            variant="primary"
            onClick={handleGenerateReports}
            disabled={conversionProgress}
            className="px-4 py-2"
          >
            {conversionProgress ? "Generating Report..." : "Generate Monthly Report"}
          </Button>
        </Col>

        {conversionProgress && (
          <Col xs={12} className="text-center mt-2">
            <div
              className="spinner-border text-primary"
              role="status"
            >
              <span className="visually-hidden">Loading...</span>
            </div>
            <p className="text-muted mb-0">Generating report, please wait...</p>
          </Col>
        )}

        <Col className="d-flex align-items-center">
          <MonthYearPicker
            onMonthYearChange={handleMonthYearChange}
            className="me-2"
          />
          <Form.Select
            value={selectedSection}
            onChange={handleSectionChange}
            style={{width: '175px', padding: '3px', borderRadius: '4px', border: '.5px solid rgb(212, 212, 212)', marginLeft: '10px'}}
          >
            <option value="">All Sections</option>
            {sections.map((section) => (
              <option
                key={section.sectionID}
                value={section.sectionID}
              >
                {section.sectionName}
              </option>
            ))}
          </Form.Select>
        </Col>

        <Col className="d-flex justify-content-end">
          <Form.Control
            style={{width: '300px'}}
            type="search"
            placeholder="Search"
            value={searchTerm}
            onChange={handleSearchChange}
          />
        </Col>
      </Row>

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