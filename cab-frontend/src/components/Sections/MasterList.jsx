import React, { useState, useEffect } from "react";
import "../table.css";
import {API_ENDPOINTS} from "../../config.js";
import { Button, Container, Table, Col, Row} from "react-bootstrap";
import BtnAddNewItem from "../Button/BtnAddNewItem.jsx";

const Masterlist = () => {
    const [items, setItems] = useState([]);

    const fetchItems = async() => {
        try {
            const response = await fetch(API_ENDPOINTS.ITEM_LIST); // Replace with your actual endpoint
            if (!response.ok) {
                throw new Error("Failed to fetch items");
            }
            const data = await response.json();
            setItems(data);
        } catch (e) {
            console.error("Error fetching items:", e);
        }
    }

    useEffect(() => {
        fetchItems();
    }, []);

    return (
        <Container style={{ width: '90%' }} fluid className="d-flex flex-column justify-content-center mt-5">
            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <input type="search" className="" placeholder="Search" style={{ width: '300px' }} />
                </Col>
            </Row>

            <Row>
                <Table responsive bordered striped hover className="tableStyle mt-3">
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Product Name</th>
                            <th>Classification</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {items.map((item) => (
                            <tr key={item.id}>
                                <td>{item.itemID    }</td>
                                <td>{item.itemName}</td>
                                <td>{item.classificationName}</td>
                            </tr>
                        ))}
                    </tbody>
                </Table>
            </Row>

            <Row>
                <Col className="d-flex justify-content-end mt-3">
                    <BtnAddNewItem />
                </Col>
            </Row>

        </Container>
    );
};

export default Masterlist;
