import React from "react";

import { Button, Container, Col, Row, Card } from "react-bootstrap";
import MonthYearPicker from "../MonthYearPicker";

const SummaryReport = () => {
    return (
        <Container>
            <Row className="mt-3">
                <Col>
                    < MonthYearPicker />
                </Col>
            </Row>

            <Row>
                <Col className="d-flex justify-content-center mt-5">
                    <Button className="shadow">
                        GENERATE MONTHLY REPORT
                    </Button>
                </Col>
            </Row>

            <Row>
                <Card className="mt-3 shadow-lg genReport">
                    <Card.Body>
                        {/* GENERATED REPORT */}
                    </Card.Body>
                </Card>
            </Row>
        </Container>
    );
};

export default SummaryReport;