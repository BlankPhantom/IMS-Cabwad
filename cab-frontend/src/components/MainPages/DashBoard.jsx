import React from "react";
import { Outlet } from "react-router-dom";
import { Container } from "react-bootstrap";
import TopNav from "../TopNav";
import CabFooter from "../CabFooter";

const DashBoard = () => {
    return (
        <div>
            <TopNav />
            <Container>
                <Outlet /> {/* This will render the current page based on the route */}
            </Container>
            <CabFooter />
        </div>
    );
};

export default DashBoard;
