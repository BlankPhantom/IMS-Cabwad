import React from "react";
import { Outlet } from "react-router-dom";
import { Container, Row, Col } from "react-bootstrap";
import SideNav from "../SideNav";
import CabFooter from "../CabFooter";

const DashBoard = () => {
    return (
        <div>
            <Row noGutters>
                <Col xs={2}>
                    <SideNav />
                </Col>
                <Col xs={10} style={{ marginLeft: "220px" }}>
                    <Container>
                        <Outlet /> {/* This will render the current page based on the route */}
                    </Container>
                    <CabFooter />
                </Col>
            </Row>
        </div>
    );
};

export default DashBoard;