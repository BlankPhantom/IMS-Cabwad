import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Container, Row, Col, Card, Button, Form } from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faChevronLeft,
  faDatabase,
  faDownload,
  faUpload,
} from "@fortawesome/free-solid-svg-icons";
import { API_ENDPOINTS } from "../../config";
import { fetchWithCSRF } from "../api";

const BackupRestore = () => {
  const [backupMessage, setBackupMessage] = useState("");
  const [restoreMessage, setRestoreMessage] = useState("");
  const [file, setFile] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  // Handle back navigation
  const handleBack = () => {
    navigate(-1); // Navigate to the previous page
  };

  const handleBackup = async () => {
    try {
      setIsLoading(true);
      setBackupMessage("Starting backup process...");
  
      const token = localStorage.getItem("access_token"); // Get JWT token
  
      // First, request the backup file from the backend
      const response = await fetchWithCSRF(API_ENDPOINTS.BACKUP, {
        method: "GET",
      });
  
      if (!response.ok) {
        throw new Error("Backup failed. Ensure you are logged in with admin privileges.");
      }
  
      // Convert response into a blob for downloading
      const blob = await response.blob();
      const url = window.URL.createObjectURL(blob);
  
      // Create a link element to trigger the download
      const a = document.createElement("a");
      a.href = url;
      a.download = "inventory_backup_" + new Date().toISOString().replace(/[:.]/g, '-') + ".sql";  // Add timestamp to filename
      document.body.appendChild(a);
      a.click();
  
      // Cleanup
      window.URL.revokeObjectURL(url);
      document.body.removeChild(a);
  
      setBackupMessage("Backup downloaded successfully!");
    } catch (error) {
      setBackupMessage("Error: " + error.message);
    } finally {
      setIsLoading(false);
    }
  };
  

  // Function to handle database restore
  const handleRestore = async () => {
    if (!file) {
      setRestoreMessage("Please select a backup file to restore.");
      return;
    }

    try {
      setIsLoading(true);
      setRestoreMessage("Restoring database...");

      const formData = new FormData();
      formData.append("backup_file", file);

      const response = await fetchWithCSRF(API_ENDPOINTS.RESTORE, {
        method: "POST",
        body: formData, // Pass FormData directly
      });

      if (response.ok) {
        const data = await response.json();
        setRestoreMessage(data.message);
        setFile(null);
        // Reset the file input
        const fileInput = document.getElementById("fileUpload");
        if (fileInput) fileInput.value = "";
      } else {
        const errorData = await response.json();
        setRestoreMessage(
          errorData.error || "An error occurred during restore."
        );
      }
    } catch (error) {
      setRestoreMessage("An error occurred while connecting to the server.");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Container
      fluid
      className="py-4 mt-5 d-flex flex-column justify-content-center me-0 ms-0">
      <Row className="sectionTitle">
        <Col>
          <h2 className="mb-5" style={{ fontWeight: "650" }}>
            Back Up and Restore
          </h2>
        </Col>
      </Row>
      {/* Backup and Restore Options */}
      <Row className="g-4 d-flex justify-content-center">
        {/* Backup Card */}
        <Col xs={12} className="d-flex justify-content-center">
          <Card
            className="landCard text-center shadow p-3"
            style={{
              width: "90%",
              maxWidth: "300px",
              minHeight: "150px",
            }}>
            <Card.Body className="d-flex flex-column justify-content-center align-items-center">
              <FontAwesomeIcon
                icon={faDownload}
                size="3x"
                className="mb-3"
                style={{ color: "#0042a5" }}
              />
              <Card.Title
                className="mt-auto"
                style={{ color: "rgb(71, 71, 71)" }}>
                Backup Database
              </Card.Title>

              <Button
                className="mt-3"
                style={{
                  backgroundColor: "#0d6efd",
                  color: "#fff",
                  border: "none",
                  borderRadius: "5px",
                  cursor: "pointer",
                  width: "100%",
                  padding: "8px 16px",
                }}
                onClick={handleBackup}
                disabled={isLoading}>
                {isLoading ? "Processing..." : "Download Backup"}
              </Button>
            </Card.Body>
          </Card>
        </Col>

        {/* Restore Card */}
        <Col xs={12} className="d-flex justify-content-center">
          <Card
            className="landCard text-center shadow p-3"
            style={{
              width: "90%",
              maxWidth: "300px",
              minHeight: "150px",
            }}>
            <Card.Body className="d-flex flex-column justify-content-center align-items-center">
              <FontAwesomeIcon
                icon={faUpload}
                size="3x"
                className="mb-3"
                style={{ color: "#0042a5" }}
              />
              <Card.Title
                className="mt-auto"
                style={{ color: "rgb(71, 71, 71)" }}>
                Restore Database
              </Card.Title>

              <Form.Group controlId="fileUpload" className="w-100 mt-3">
                <Form.Control
                  type="file"
                  accept=".sql"
                  onChange={(e) => setFile(e.target.files[0])}
                  style={{
                    fontSize: "14px",
                    border: "1px solid #ccc",
                    borderRadius: "5px",
                    padding: "5px",
                  }}
                />
                <Form.Text className="text-muted text-center">
                  {file ? `Selected file: ${file.name}` : "No file selected"}
                </Form.Text>
              </Form.Group>

              <Button
                className="mt-3"
                style={{
                  backgroundColor: "#0d6efd",
                  color: "#fff",
                  border: "none",
                  borderRadius: "5px",
                  cursor: "pointer",
                  width: "100%",
                  padding: "8px 16px",
                }}
                onClick={handleRestore}
                disabled={isLoading || !file}>
                {isLoading ? "Processing..." : "Restore"}
              </Button>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      {/* Messages */}
      <Row className="mt-4 d-flex flex-column align-items-center">
        {backupMessage && (
          <p
            className={
              backupMessage.includes("success") ||
              backupMessage.includes("started")
                ? "text-success"
                : "text-danger"
            }>
            {backupMessage}
          </p>
        )}
        {restoreMessage && (
          <p
            className={
              restoreMessage.includes("success")
                ? "text-success"
                : "text-danger"
            }>
            {restoreMessage}
          </p>
        )}
      </Row>
    </Container>
  );
};

export default BackupRestore;
