import React, { useState } from 'react';
import { faPenToSquare, faTrashAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button } from 'react-bootstrap';
import EditTransactionModal from '../Modals/EditTransactionModal';
import { API_ENDPOINTS } from "../../config";

const BtnEditDeleteTransaction = ({ transaction, onUpdate, onDelete, fetchTransactionsWithProducts }) => {
    const [showEditTransactionModal, setShowEditTransactionModal] = useState(false);
    const [editTransactionData, setEditTransactionData] = useState(transaction);

    const handleShowEditTransactionModal = () => {
        console.log("Editing Transaction ID:", transaction.transactionDetailsID); // ✅ Log the ID
        setEditTransactionData(transaction); // Ensure modal has latest data
        setShowEditTransactionModal(true);
    };

    const handleCloseEditTransactionModal = () => setShowEditTransactionModal(false);

    const handleEditTransactionChange = (e) => {
        const { name, value } = e.target;
        let updatedData = {
            ...editTransactionData,
            [name]: value,
        };
    
        if (name === "date") {
            updatedData.week = getWeekNumber(value);
        }
    
        setEditTransactionData(updatedData);
    };

    return (
        <>
            <div style={{ display: 'flex', justifyContent: 'center', gap: '8px' }}>
                <Button variant="warning" size="sm" style={{ fontSize: "9px" }} onClick={handleShowEditTransactionModal}>
                    <FontAwesomeIcon icon={faPenToSquare} />
                </Button>
                <Button variant="danger" size="sm" onClick={() => onDelete(transaction.transactionDetailsID)} style={{ fontSize: "9px" }}>
                    <FontAwesomeIcon icon={faTrashAlt} />
                </Button>

            </div>

            <EditTransactionModal
                show={showEditTransactionModal}
                handleClose={handleCloseEditTransactionModal}
                transactionData={editTransactionData}
                handleChange={handleEditTransactionChange}
                setEditTransactionData={setEditTransactionData}
                handleShow={handleShowEditTransactionModal}
            />
        </>
    );
};

export default BtnEditDeleteTransaction;

// Helper functions
function getCurrentDate() {
    const today = new Date();
    return today.toISOString().split("T")[0];
}

function getWeekNumber(dateString) {
    const date = new Date(dateString);
    const startDate = new Date(date.getFullYear(), date.getMonth(), 1);
    const days = Math.floor((date - startDate) / (24 * 60 * 60 * 1000));
    const week = Math.ceil((days + 1) / 7);

    return Math.min(week, 4);
}

