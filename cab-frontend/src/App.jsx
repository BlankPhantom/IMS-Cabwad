import React, { useState } from "react";
import {
  Container,
  Navbar,
  Nav,
  Table,
  Button,
  Modal,
  Form,
} from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";

function App() {
  const [showModal, setShowModal] = useState(false);
  const [inventory, setInventory] = useState([]);
  const [currentItem, setCurrentItem] = useState({ id: null, name: "", category: "", quantity: "" });

  const handleShowModal = (item = { id: null, name: "", category: "", quantity: "" }) => {
    setCurrentItem(item);
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
    setCurrentItem({ id: null, name: "", category: "", quantity: "" });
  };

  const handleSave = () => {
    if (currentItem.id) {
      setInventory(
        inventory.map((item) =>
          item.id === currentItem.id ? currentItem : item
        )
      );
    } else {
      setInventory([
        ...inventory,
        { ...currentItem, id: inventory.length + 1 },
      ]);
    }
    handleCloseModal();
  };

  const handleDelete = (id) => {
    setInventory(inventory.filter((item) => item.id !== id));
  };

  return (
    <div>
      {/* Navbar */}
      <Navbar style={{backgroundColor:"#005CE5"}} expand="lg">
        <Container>
          <Navbar.Brand href="#" className="h1" style={{color:"white", fontSize:"30px"}}>Cabuyao Water District Inventory</Navbar.Brand>
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
          </Navbar.Collapse>
        </Container>
      </Navbar>

      {/* Main Content */}
      <Container className="mt-4">
        <h1>Inventory Management</h1>
        <div className="text-end">
          <Button variant="primary" onClick={() => handleShowModal()}>+ Add Item</Button>
        </div>

        <Table striped bordered hover className="mt-3">
          <thead className="text-center">
            <tr>
              <th>Item ID</th>
              <th>Item Name</th>
              <th>Category</th>
              <th>Quantity</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody className="text-center">
            {inventory.map((item, index) => (
              <tr key={item.id}>
                <td>{index + 1}</td>
                <td>{item.name}</td>
                <td>{item.category}</td>
                <td>{item.quantity}</td>
                <td>
                  <Button
                    style={{fontSize:"13px"}}
                    variant="warning"
                    className="me-2"
                    onClick={() => handleShowModal(item)}
                  >
                    Edit
                  </Button>
                  <Button
                    style={{fontSize:"13px"}}
                    variant="danger"
                    onClick={() => handleDelete(item.id)}
                  >
                    Delete
                  </Button>
                </td>
              </tr>
            ))}
          </tbody>
        </Table>
      </Container>

      {/* Add/Edit Item Modal */}
      <Modal show={showModal} onHide={handleCloseModal}>
        <Modal.Header closeButton>
          <Modal.Title>{currentItem.id ? "Edit Item" : "Add Item"}</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3">
              <Form.Label>Item Name</Form.Label>
              <Form.Control
                type="text"
                value={currentItem.name}
                onChange={(e) =>
                  setCurrentItem({ ...currentItem, name: e.target.value })
                }
                placeholder="Enter item name"
              />
            </Form.Group>

            <Form.Group className="mb-3">
              <Form.Label>Category</Form.Label>
              <Form.Control
                type="text"
                value={currentItem.category}
                onChange={(e) =>
                  setCurrentItem({ ...currentItem, category: e.target.value })
                }
                placeholder="Enter category"
              />
            </Form.Group>

            <Form.Group className="mb-3">
              <Form.Label>Quantity</Form.Label>
              <Form.Control
                type="number"
                value={currentItem.quantity}
                onChange={(e) =>
                  setCurrentItem({ ...currentItem, quantity: parseInt(e.target.value) || "" })
                }
                placeholder="Enter quantity"
              />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCloseModal}>
            Cancel
          </Button>
          <Button variant="primary" onClick={handleSave}>
            Save
          </Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
}

export default App;
