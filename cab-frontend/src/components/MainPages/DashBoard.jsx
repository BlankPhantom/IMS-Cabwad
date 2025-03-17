import React from "react";
import { Outlet } from "react-router-dom";
import { Container, Row, Col } from "react-bootstrap";
import SideNav from "../SideNav";
import CabFooter from "../CabFooter";
import TopNav from "../TopNav";

const DashBoard = () => {
    return (
        <div style={{backgroundColor: '#f8f9fa'}}>
            <TopNav />
            <Row>
                <Col xs={2}>
                    <SideNav />
                </Col>
                <Col xs={10} style={{ marginLeft: "220px" }}>
                    <Container className="mb-5">
                        <Outlet /> {/* This will render the current page based on the route */}
                    </Container>
                    <CabFooter />
                </Col>
            </Row>
        </div>
    );
};

export default DashBoard;