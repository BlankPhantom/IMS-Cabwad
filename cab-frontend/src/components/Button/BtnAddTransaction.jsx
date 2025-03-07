import React from 'react';
import { Button, Row, Col } from 'react-bootstrap';

const BtnAddTransaction = ({ handleShowTransactionModal }) => {
    return (
        <Row>
            <Col className="d-flex justify-content-end">
                <Button onClick={handleShowTransactionModal} variant="primary">
                    + Record New Transaction
                </Button>
            </Col>
        </Row>
    );
};

export default BtnAddTransaction;