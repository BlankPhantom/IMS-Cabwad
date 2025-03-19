import React from "react";
import { Navbar } from "react-bootstrap";
import Logo from "/src/assets/cabwadLogo.png";
import { faCircleUser } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useNavigate } from "react-router-dom";

const TopNav = () => {
    const navigate = useNavigate(); 

    const handleUserIconClick = () => {
        navigate("./my-profile"); 
    };

    return (
        <Navbar className="topNav d-flex justify-content-between">
            <div className="d-flex align-items-center justify-content-center flex-grow-1" style={{ color: "white", marginLeft: '370px' }}>
                <img className="logo img-fluid" src={Logo} alt="Cabuyao Water District" style={{ height: "35px" }} />
                <span className="fw-bold text-center">Cabuyao Water District Inventory Management System</span>
            </div>
            <div className="d-flex align-items-center" style={{ color: "white", marginRight: "170px" }}>
                <FontAwesomeIcon icon={faCircleUser} style={{cursor: "pointer", fontSize: "1.5em", marginRight: "5px" }} onClick={handleUserIconClick} /> {/* Add onClick handler */}
            </div>
        </Navbar>
    );
};

export default TopNav;
