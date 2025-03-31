import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Container, Row, Col, Card, Button, Form, Modal } from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faChevronLeft,
  faDatabase,
  faDownload,
  faUpload,
} from "@fortawesome/free-solid-svg-icons";
import { API_ENDPOINTS } from "../../config";

const BackupRestore = () => {
  const [backupMessage, setBackupMessage] = useState("");
  const [restoreMessage, setRestoreMessage] = useState("");
  const [file, setFile] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [showRestoreWarningModal, setShowRestoreWarningModal] = useState(false);
  const navigate = useNavigate();

  // Handle back navigation
  const handleBack = () => {
    navigate(-1);
  };

  const handleBackup = async () => {
    try {
      setIsLoading(true);
      setBackupMessage("Starting backup process...");
  
      const token = localStorage.getItem("access_token");
  
      const response = await fetch(API_ENDPOINTS.BACKUP, {
        method: "GET",
        headers: {
          Authorization: `Token ${token}`,
        },
      });
  
      if (!response.ok) {
        throw new Error("Backup failed. Ensure you are logged in with admin privileges.");
      }
  
      const blob = await response.blob();
      const url = window.URL.createObjectURL(blob);
  
      const a = document.createElement("a");
      a.href = url;
      a.download = "inventory_backup_" + new Date().toISOString().replace(/[:.]/g, '-') + ".sql";
      document.body.appendChild(a);
      a.click();
  
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
  const handleRestoreInitiate = () => {
    if (!file) {
      setRestoreMessage("Please select a backup file to restore.");
      return;
    }
    // Show warning modal before actual restore
    setShowRestoreWarningModal(true);
  };

  const confirmRestore = async () => {
    // Close the warning modal
    setShowRestoreWarningModal(false);

    try {
      setIsLoading(true);
      setRestoreMessage("Restoring database...");

      const formData = new FormData();
      formData.append("backup_file", file);

      const token = localStorage.getItem("access_token");
      const response = await fetch(API_ENDPOINTS.RESTORE, {
        method: "POST",
        headers: {
          Authorization: `Token ${token}`,
        },
        body: formData,
      });

      if (response.ok) {
        const data = await response.json();
        setRestoreMessage(data.message);
        
        // Logout after successful restore
        localStorage.removeItem("access_token");
        localStorage.removeItem("user_id"); // Remove user ID from local storage
        localStorage.removeItem("is_staff"); // Remove user ID from local storage
        localStorage.removeItem("is_superuser"); // Remove user ID from local storage
        navigate("/");
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
      setFile(null);
      // Reset the file input
      const fileInput = document.getElementById("fileUpload");
      if (fileInput) fileInput.value = "";
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
                onClick={handleRestoreInitiate}
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

      {/* Restore Warning Modal */}
      <Modal 
        show={showRestoreWarningModal} 
        onHide={() => setShowRestoreWarningModal(false)}
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title>Database Restore Warning</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <p className="text-danger"><strong>Important: Database Restoration Notice</strong></p>
          <ul>
            <li>Restoring the database will reset all user accounts</li>
            <li>All user passwords will be reset to their default values (cabwad123)</li>
            <li>You will be automatically logged out after restoration</li>
            <li>Please change your password after logging back in</li>
          </ul>
          <p>Are you sure you want to proceed with the database restoration?</p>
        </Modal.Body>
        <Modal.Footer>
          <Button 
            variant="secondary" 
            onClick={() => setShowRestoreWarningModal(false)}
          >
            Cancel
          </Button>
          <Button 
            variant="danger" 
            onClick={confirmRestore}
          >
            Confirm Restore
          </Button>
        </Modal.Footer>
      </Modal>
    </Container>
  );
};

export default BackupRestore;