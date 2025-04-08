import React, { useState, useEffect, useRef, useCallback } from "react";
import "../table.css";
import { API_ENDPOINTS } from "../../config.js";
import {
  Container,
  Table,
  Col,
  Row,
  Pagination,
  Modal,
  Button,
} from "react-bootstrap";
import { useNavigate } from 'react-router-dom';
import BtnAddNewItem from "../Button/BtnAddNewItem.jsx";
import BtnEditDeleteMaster from "../Button/BtnEditDeleteMaster.jsx";
import EditMasterModal from "../Modals/EditMasterModal.jsx";

const Masterlist = () => {
  const navigate = useNavigate();
  const [items, setItems] = useState([]);
  const [itemToEdit, setItemToEdit] = useState(null);
  const [currentItems, setCurrentItems] = useState([]);
  const [classifications, setClassifications] = useState([]);
  const [measurements, setMeasurements] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [showDeleteModal, setShowDeleteModal] = useState(false);
  const [itemToDelete, setItemToDelete] = useState(null);
  // Pagination states
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalItems, setTotalItems] = useState(0);
  const [itemsPerPage] = useState(20);

  const fetchItems = async (page = 1) => {
    setLoading(true);
    const token = localStorage.getItem("access_token");

    try {
      const response = await fetch(`${API_ENDPOINTS.ITEM_LIST}?page=${page}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`,
        },
      });

      if (response.ok) {
        const data = await response.json();

        // DRF Pagination structure
        setItems(data.results);
        setCurrentItems(data.results);
        setTotalPages(Math.ceil(data.count / itemsPerPage));
        setTotalItems(data.count);
        setCurrentPage(page);
      } else {
        console.error("Failed to fetch items");
        setError("Failed to load items data.");
      }
    } catch (error) {
      console.error("Error fetching items:", error);
      setError("Failed to load items data.");
    } finally {
      setLoading(false);
    }
  };

  const fetchClassifications = async () => {
    const token = localStorage.getItem("access_token");

    try {
      const response = await fetch(API_ENDPOINTS.CLASSIFICATIONS_LIST, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`,
        },
      });

      if (!response.ok) {
        throw new Error("Failed to fetch classifications");
      } else {
        const data = await response.json();
        setClassifications(data);
      }
    } catch (e) {
      console.error("Error fetching classifications:", e);
    }
  };

  const fetchMeasurements = async () => {
    const token = localStorage.getItem("access_token");

    try {
      const response = await fetch(API_ENDPOINTS.MEASUREMENTS_LIST, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`,
        },
      });

      if (!response.ok) {
        throw new Error("Failed to fetch measurements");
      } else {
        const data = await response.json();
        setMeasurements(data);
      }
    } catch (e) {
      console.error("Error fetching measurements:", e);
    }
  };

  const handleSearchChange = async (e, page = 1) => {
    const term = e.target.value.toLowerCase();
    setSearchTerm(term);

    if (!term) {
      // Reset to first page of all items
      fetchItems(1);
      return;
    }

    try {
      const token = localStorage.getItem("access_token");
      const response = await fetch(`${API_ENDPOINTS.ITEM_SEARCH}?search=${term}&page=${page}`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`,
        },
      });

      if (response.ok) {
        const data = await response.json();
        setItems(data.results);
        setCurrentItems(data.results);
        setTotalPages(Math.ceil(data.count / itemsPerPage));
        setTotalItems(data.count);
        setCurrentPage(1);
      }
    } catch (error) {
      console.error("Search failed:", error);
    }
  };

  const handleDelete = (id) => {
    const item = items.find((item) => item.itemID === id);
    if (item) {
      setItemToDelete(item);
      setShowDeleteModal(true);
    }
  };

  const handleCloseDeleteModal = () => {
    setShowDeleteModal(false);
    setItemToDelete(null);
  };

  const deleteItem = async (id) => {
    const token = localStorage.getItem("access_token");
    try {
      const response = await fetch(API_ENDPOINTS.DELETE_ITEM(id), {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Token ${token}`,
        },
      });
      if (!response.ok) {
        throw new Error("Failed to delete item");
      }
      fetchItems();
      setCurrentItems(null);
    } catch (e) {
      console.error("Error deleting item:", e);
      window.alert("Failed to delete item.");
    }
  };

  const handleEdit = (id) => {
    const item = items.find((item) => item.itemID === id);
    if (item) {
      console.log("Selected Item:", item);
      setItemToEdit(item); // Use itemToEdit instead of currentItems
      setShowModal(true);
    }
  };

  const handleCloseModal = () => {
    setShowModal(false);
    setItemToEdit(null); // Reset itemToEdit
  };

  const handleSaveChanges = async (updatedItemData) => {
    const token = localStorage.getItem("access_token");
    try {
      // Ensure all necessary fields are included
      const finalItemData = {
        itemID: updatedItemData.itemID,
        itemName: updatedItemData.itemName,
        classificationID: updatedItemData.classificationID,
        measurementID: updatedItemData.measurementID,
        unitCost: updatedItemData.unitCost,
      };

      const response = await fetch(
        API_ENDPOINTS.UPDATE_ITEM(updatedItemData.itemID),
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Token ${token}`,
          },
          body: JSON.stringify(finalItemData),
        }
      );

      if (!response.ok) {
        const errorText = await response.text();
        console.error("Failed to update item. Response:", errorText);
        throw new Error("Failed to update item");
      }

      // Refetch items to ensure fresh data
      await fetchItems(currentPage);
      handleCloseModal();
    } catch (e) {
      console.error("Error updating item:", e);
      window.alert("Failed to update item.");
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setItemToEdit((prevState) => ({
      ...prevState,
      [name]:
        name === "measurementID" || name === "classificationID"
          ? parseInt(value, 10)
          : value,
    }));
  };

  useEffect(() => {
    fetchItems();
    fetchClassifications();
    fetchMeasurements();
  }, []);

  const paginate = (pageNumber) => {
    if (pageNumber >= 1 && pageNumber <= totalPages) {
      fetchItems(pageNumber);
    }
  };

  // Render pagination items
  const renderPaginationItems = () => {
    const pageNumbers = [];
    const totalPagesToShow = 5;
    let startPage, endPage;

    if (totalPages <= totalPagesToShow) {
      startPage = 1;
      endPage = totalPages;
    } else {
      if (currentPage <= Math.ceil(totalPagesToShow / 2)) {
        startPage = 1;
        endPage = totalPagesToShow;
      } else if (currentPage + Math.floor(totalPagesToShow / 2) >= totalPages) {
        startPage = totalPages - totalPagesToShow + 1;
        endPage = totalPages;
      } else {
        startPage = currentPage - Math.floor(totalPagesToShow / 2);
        endPage = currentPage + Math.floor(totalPagesToShow / 2);
      }
    }

    // First page button
    if (startPage > 1) {
      pageNumbers.push(
        <Pagination.Item key="first" onClick={() => paginate(1)}>
          1
        </Pagination.Item>
      );
      if (startPage > 2) {
        pageNumbers.push(<Pagination.Ellipsis key="first-ellipsis" />);
      }
    }

    // Page number buttons
    for (let i = startPage; i <= endPage; i++) {
      pageNumbers.push(
        <Pagination.Item
          key={i}
          active={i === currentPage}
          onClick={() => paginate(i)}>
          {i}
        </Pagination.Item>
      );
    }

    // Last page button
    if (endPage < totalPages) {
      if (endPage < totalPages - 1) {
        pageNumbers.push(<Pagination.Ellipsis key="last-ellipsis" />);
      }
      pageNumbers.push(
        <Pagination.Item key="last" onClick={() => paginate(totalPages)}>
          {totalPages}
        </Pagination.Item>
      );
    }

    return pageNumbers;
  };

  return (
    <Container
      style={{ width: "100%" }}
      fluid
      className="d-flex flex-column justify-content-center mt-2">
      <Row className="sectionTitle">
        <Col>
          <h2 className="mt-5" style={{ fontWeight: "650" }}>
            Master List
          </h2>
        </Col>
      </Row>
      <Row>
        <Col className="d-flex justify-content-end mt-3">
          <input
            type="search"
            className="form-control"
            placeholder="Search"
            style={{ width: "300px" }}
            value={searchTerm}
            onChange={handleSearchChange}
          />
        </Col>
      </Row>

      {/* Table */}
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
            {loading ? (
              <tr>
                <td colSpan="4" className="text-center">
                  Loading more items...
                </td>
              </tr>
            ) : error ? (
              <tr>
                <td colSpan="4" className="text-center text-danger">
                  {error}
                </td>
              </tr>
            ) : currentItems && currentItems.length > 0 ? (
              currentItems.map((item) => (
                <tr key={item.id}>
                  <td>{item.itemID}</td>
                  <td>{item.itemName}</td>
                  <td>{item.classificationName}</td>
                  <td width={"150px"}>
                    <BtnEditDeleteMaster
                      onEdit={() => handleEdit(item.itemID)}
                      onDelete={() => handleDelete(item.itemID)}
                      onViewHistory={() =>
                        navigate(
                          `/dashboard/transaction-history/${item.itemID}/${encodeURIComponent(item.itemName)}`
                        )
                      }
                    />
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="4">No items found</td>
              </tr>
            )}
          </tbody>
        </Table>
      </Row>

      {/* Pagination */}
      {!loading && !error && totalPages > 1 && (
        <Row>
          <Col className="d-flex justify-content-center mt-3">
            <Pagination>
              <Pagination.First
                onClick={() => paginate(1)}
                disabled={currentPage === 1}
              />
              <Pagination.Prev
                onClick={() => paginate(currentPage - 1)}
                disabled={currentPage === 1}
              />

              {renderPaginationItems()}

              <Pagination.Next
                onClick={() => paginate(currentPage + 1)}
                disabled={currentPage === totalPages}
              />
              <Pagination.Last
                onClick={() => paginate(totalPages)}
                disabled={currentPage === totalPages}
              />
            </Pagination>
          </Col>
        </Row>
      )}

      <Row>
        <Col className="d-flex justify-content-end">
          <BtnAddNewItem
            fetchItems={fetchItems}
            classifications={classifications}
            measurements={measurements}
          />
        </Col>
      </Row>

      <Modal show={showDeleteModal} onHide={handleCloseDeleteModal} centered>
        <Modal.Header closeButton>
          <Modal.Title>Confirm Deletion</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          {itemToDelete && (
            <>
              <p>
                Are you sure you want to delete the item "
                {itemToDelete.itemName}" (ID: {itemToDelete.itemID})?
              </p>
              <p>This action cannot be undone.</p>
            </>
          )}
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleCloseDeleteModal}>
            Cancel
          </Button>
          <Button
            variant="danger"
            onClick={() => {
              if (itemToDelete) {
                deleteItem(itemToDelete.itemID);
                handleCloseDeleteModal();
              }
            }}>
            Delete Item
          </Button>
        </Modal.Footer>
      </Modal>
      <EditMasterModal
        show={showModal}
        handleClose={handleCloseModal}
        itemData={itemToEdit} // Pass itemToEdit here
        handleInputChange={handleChange}
        handleSave={handleSaveChanges}
        classifications={classifications}
        measurements={measurements}
      />
    </Container>
  );
};

export default Masterlist;
