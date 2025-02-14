import React from "react";
import { Navbar } from "react-bootstrap";
import Logo from "/src/assets/cabwadLogo.png";

const TopNav = () => {
    return (
        <Navbar className="topNav d-flex justify-content-center">
            <div className="d-flex align-items-center" style={{ color: "white", marginLeft: "170px"  }}>    
                <img className="logo img-fluid" src={Logo} alt="Cabuyao Water District" style={{ height: "35px"}} />
                <span className="fw-bold text-center">Cabuyao Water District Inventory Management System</span>
            </div>
        </Navbar>
    );
};

export default TopNav;
