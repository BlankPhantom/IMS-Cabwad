import React, { useState } from "react";
import '../App.css';
import { Navbar, Nav, Modal, Button } from "react-bootstrap";
import { Link, useLocation, useNavigate } from "react-router-dom";
import Logo from "/src/assets/cabwadLogo.png";

const TopNav = () => {
    const location = useLocation(); // Get current route
    const navigate = useNavigate(); // For navigation
    const [showLogoutModal, setShowLogoutModal] = useState(false); // State to manage modal visibility

    const handleLogout = () => {
        // Perform logout logic here
        navigate("/"); // Redirect to login page after logout
    };

    return (
        <>
            <Navbar expand="lg" className="topNav py-2" style={{ backgroundColor: "#005ce5" }}>
                <Navbar.Brand as={Link} to="/dashboard/masterlist" className="d-flex align-items-center">
                    <img className="logo img-fluid" src={Logo} alt="Cabuyao Water District" style={{ height: "60px", marginLeft: '1em' }} />
                </Navbar.Brand>

                <Navbar.Toggle aria-controls="navbar-nav" className="border-0 bg-white" />

                <Navbar.Collapse id="navbar-nav" className="justify-content-center">
                    <Nav className="d-flex gap-2">
                        {["MASTERLIST", "BEGINNING BALANCE", "TRANSACTIONS", "RUNNING BALANCE", "MONTHLY CONSUMPTION", "SUMMARY REPORT"].map((item, index) => {
                            const path = `/dashboard/${item.toLowerCase().replace(/\s+/g, '-')}`;
                            return (
                                <Nav.Link
                                    as={Link}
                                    to={path}
                                    key={index}
                                    className={`fw-semibold nav-link-custom ${location.pathname === path ? 'active-link' : 'text-white'}`}
                                >
                                    {item}
                                </Nav.Link>
                            );
                        })}
                    </Nav>
                </Navbar.Collapse>

                <Nav className="ms-auto">
                    <Nav.Link
                        className="text-white fw-bold"
                        style={{ marginRight: '1em' }}
                        onClick={() => setShowLogoutModal(true)}
                    >
                        Logout
                    </Nav.Link>
                </Nav>
            </Navbar>

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

export default TopNav;