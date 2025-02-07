import React, { useState } from "react";
import { Row, Col, Container } from "react-bootstrap";
import Masterlist from "../Sections/MasterList";
import TopNav  from "../TopNav"
import BeginningBalance from "../Sections/BeginningBalance";
import Transactions from "../Sections/Transactions";
import RunningBalance from "../Sections/RunningBalance";

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