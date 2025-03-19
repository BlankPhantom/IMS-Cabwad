import React, { useState } from "react";
import "../App.css";
import { Nav, Modal, Button } from "react-bootstrap";
import { Link, useLocation, useNavigate } from "react-router-dom";
import { API_ENDPOINTS } from "../config";
import { fetchWithCSRF } from "./api";

const SideNav = () => {
  const location = useLocation(); // Get current route
  const navigate = useNavigate(); // For navigation
  const [showLogoutModal, setShowLogoutModal] = useState(false); // State to manage modal visibility

  const handleLogout = async () => {
    const csrfToken = document.cookie
      .split("; ")
      .find((row) => row.startsWith("csrftoken"))
      ?.split("=")[1];

    try {
      await fetchWithCSRF(API_ENDPOINTS.LOGOUT, {
        method: "POST",
        headers: {
          "X-CSRFToken": csrfToken, // Include CSRF token
        },
        credentials: "include",
      });

      sessionStorage.clear();
      window.location.href = "/";
    } catch (error) {
      console.error("Logout failed", error);
    }
  };

  return (
    <>
      <div
        className="sideNav"
        style={{
          width: "200px",
          height: "100vh",
          backgroundColor: "#005ce5",
          position: "fixed",
        }}>
        <Nav className="flex-column p-3 mt-5">
          {[
            "Masterlist",
            "Beginning Balance",
            "Transactions",
            "Running Balance",
            "Monthly Consumption",
            "Weekly Consumption",
            "Account Management",
          ].map((item, index) => {
            const path = `/dashboard/${item
              .toLowerCase()
              .replace(/\s+/g, "-")}`;
            return (
              <Nav.Link
                style={{
                  fontWeight: "400",
                  textShadow: "0.5px 0.5px 0.5px #000",
                }}
                as={Link}
                to={path}
                key={index}
                className={` nav-link-custom ${
                  location.pathname === path ? "active-link" : "text-white"
                }`}>
                {item}
              </Nav.Link>
            );
          })}
        </Nav>

        <Nav className="mt-auto p-3">
          <Nav.Link
            style={{ fontWeight: "400", textShadow: "0.5px 0.5px 0.5px #000" }}
            as={Link}
            to="/dashboard/backup-restore"
            className={`nav-link-custom ${
              location.pathname === "/dashboard/backup-restore"
                ? "active-link"
                : "text-white"
            }`}>
            Back Up and Restore
          </Nav.Link>
        </Nav>
        <Nav className="mt-auto p-3">
          <Nav.Link
            style={{ fontWeight: "400", textShadow: "0.5px 0.5px 0.5px #000" }}
            className="text-white"
            onClick={() => setShowLogoutModal(true)}>
            Logout
          </Nav.Link>
        </Nav>
      </div>

      {/* Logout Confirmation Modal */}
      <Modal show={showLogoutModal} onHide={() => setShowLogoutModal(false)}>
        <Modal.Header closeButton>
          <Modal.Title>Confirm Logout</Modal.Title>
        </Modal.Header>
        <Modal.Body>Are you sure you want to logout?</Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={() => setShowLogoutModal(false)}>
            Cancel
          </Button>
          <Button variant="primary" onClick={handleLogout}>
            Logout
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default SideNav;
