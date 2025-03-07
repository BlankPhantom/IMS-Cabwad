import React, { useState } from "react";
import { useNavigate } from 'react-router-dom';
import { Container, Row, Col, Card, Button, Form } from "react-bootstrap";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChevronLeft, faDatabase, faDownload, faUpload } from "@fortawesome/free-solid-svg-icons";
import { API_ENDPOINTS } from "../../config";

const BackupRestore = () => {
  const [backupMessage, setBackupMessage] = useState("");
  const [restoreMessage, setRestoreMessage] = useState("");
  const [file, setFile] = useState(null);
  const navigate = useNavigate();

  // Handle back navigation
  const handleBack = () => {
    navigate(-1);  // Navigate to the previous page
  };

  // Function to handle database backup
  const handleBackup = async () => {
    try {
      const token = localStorage.getItem("access_token"); // Get JWT token
      const response = await fetch(API_ENDPOINTS.BACKUP, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`, // Include token in the header
        },
      });

      if (response.ok) {
        const data = await response.json();
        setBackupMessage(data.message);
      } else {
        const errorData = await response.json();
        setBackupMessage(errorData.error || "An error occurred during backup.");
      }
    } catch (error) {
      setBackupMessage("An error occurred while connecting to the server.");
    }
  };

  // Function to handle database restore
  const handleRestore = async () => {
    if (!file) {
      setRestoreMessage("Please select a backup file to restore.");
      return;
    }

    const formData = new FormData();
    formData.append("backup_file", file);

    try {
      const token = localStorage.getItem("access_token"); // Get JWT token
      const response = await fetch(API_ENDPOINTS.RESTORE, {
        method: "POST",
        headers: {
          Authorization: `Token ${token}`, // Include token in the header
        },
        body: formData, // Pass FormData directly
      });

      if (response.ok) {
        const data = await response.json();
        setRestoreMessage(data.message);
      } else {
        const errorData = await response.json();
        setRestoreMessage(errorData.error || "An error occurred during restore.");
      }
    } catch (error) {
      setRestoreMessage("An error occurred while connecting to the server.");
    }
  };

  return (
    <Container fluid className="py-4 mt-5 d-flex flex-column justify-content-center me-0 ms-0">
      <Row className="sectionTitle">
        <Col>
          <h2 className="mb-5" style={{ fontWeight: '650' }}>Back Up and Restore</h2>
        </Col>
      </Row>
      {/* Backup and Restore Options */}
      <Row className="g-4 d-flex justify-content-center">
        {/* Backup Card */}
        <Col xs={12} className="d-flex justify-content-center">
          <Card
            onClick={handleBackup}
            className="clickable-card landCard text-center shadow p-3"
            style={{
              cursor: "pointer",
              width: "90%",
              maxWidth: "300px",
              minHeight: "150px",
            }}
          >
            <Card.Body className="d-flex flex-column justify-content-center align-items-center">
              <FontAwesomeIcon icon={faDownload} size="3x" className="mb-3" style={{ color: "#0042a5" }} />
              <Card.Title className="mt-auto" style={{color: 'rgb(71, 71, 71)'}}>Backup Database</Card.Title>
            </Card.Body>
          </Card>
        </Col>

        {/* Restore Card */}
        <Col xs={12} className="d-flex justify-content-center">
          <Card
            className="landCard text-center shadow  p-3"
            style={{
              width: "90%",
              maxWidth: "300px",
              minHeight: "150px",
            }}
          >
            <Card.Body className="d-flex flex-column justify-content-center align-items-center">
              <FontAwesomeIcon icon={faUpload} size="3x" className="mb-3" style={{ color: "#0042a5" }} />
              <Card.Title className="mt-auto" style={{color: 'rgb(71, 71, 71)'}}>Restore Database</Card.Title>

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
                  color: "#fff",
                  border: "none",
                  borderRadius: "5px",
                  cursor: "pointer",
                }}
                onClick={handleRestore}
              >
                Restore
              </Button>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      {/* Messages */}
      <Row className="mt-4 d-flex flex-column align-items-center">
        {backupMessage && (
          <p className={backupMessage.includes("successful") ? "text-success" : "text-danger"}>{backupMessage}</p>
        )}
        {restoreMessage && (
          <p className={restoreMessage.includes("successfully") ? "text-success" : "text-danger"}>{restoreMessage}</p>
        )}
      </Row>
    </Container>
  );
};

export default BackupRestore;