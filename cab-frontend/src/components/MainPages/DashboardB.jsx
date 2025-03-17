import React from "react";
import { Outlet } from "react-router-dom";
import { Container, Row, Col } from "react-bootstrap";
import CabFooter from "../CabFooter";
import TopNav from "../TopNav";
import SideNavB from "../SideNavB";

const DashBoardB = () => {
    return (
        <div>
            <TopNav />
            <Row>
                <Col xs={2}>
                    <SideNavB />
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

export default DashBoardB;