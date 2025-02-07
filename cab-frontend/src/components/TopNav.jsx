import React from "react";
import '../App.css';
import { Navbar, Nav } from "react-bootstrap";
import { Link, useLocation } from "react-router-dom";
import Logo from "/src/assets/cabwadLogo.png";

const TopNav = () => {
    const location = useLocation(); // Get current route

    return (
        <Navbar expand="lg" className="topNav py-2" style={{ backgroundColor: "#005ce5" }}>
            <Navbar.Brand as={Link} to="/masterlist" className="d-flex align-items-center">
                <img className="logo img-fluid" src={Logo} alt="Cabuyao Water District" style={{ height: "100px", marginLeft: '1em' }} />
            </Navbar.Brand>

            <Navbar.Toggle aria-controls="navbar-nav" className="border-0 bg-white" />

            <Navbar.Collapse id="navbar-nav" className="justify-content-center">
                <Nav className="d-flex gap-2">
                    {["MASTERLIST", "BEGINNING BALANCE", "TRANSACTIONS", "RUNNING BALANCE", "MONTHLY CONSUMPTION", "SUMMARY REPORT"].map((item, index) => {
                        const path = `/${item.toLowerCase().replace(/\s+/g, '-')}`;
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
                <Nav.Link as={Link} to="/logout" className="text-white fw-bold" style={{ marginRight: '1em' }}>
                    Logout
                </Nav.Link>
            </Nav>
        </Navbar>
    );
};

export default TopNav;
