import React from "react";

import { Button, Container, Col, Row, Card } from "react-bootstrap";

const SummaryReport = () => {
    return (
        <Container>
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

                    </Card.Body>
                </Card>
                {/* GENERATED REPORT */}
            </Row>
        </Container>
    );
};

export default SummaryReport;