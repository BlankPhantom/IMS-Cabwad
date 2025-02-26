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
        setEditTransactionData(transaction); // Ensure modal has the latest data
        setShowEditTransactionModal(true);
    };

    const handleCloseEditTransactionModal = () => setShowEditTransactionModal(false);

    const handleEditTransactionChange = (e) => {
        const { name, value } = e.target;
        setEditTransactionData((prevData) => ({
            ...prevData,
            [name]: value,
        }));
    };

    const handleSubmitEditTransaction = async (e) => {
        e.preventDefault();

        try {
            const response = await fetch(API_ENDPOINTS.UPDATE_TRANSACTION(editTransactionData.transactionDetailsID), {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Token ${localStorage.getItem("access_token")}`,
                },
                body: JSON.stringify(editTransactionData),
            });

            if (!response.ok) {
                throw new Error("Failed to update transaction");
            }

            const updatedTransaction = await response.json();
            onUpdate(updatedTransaction); // Update UI with new transaction data

            alert("Transaction and products have been successfully updated!"); // ✅ Success message
            fetchTransactionsWithProducts(); // ✅ Refresh transaction list

            handleCloseEditTransactionModal();
        } catch (error) {
            console.error("Error updating transaction:", error);
            alert("Error updating transaction. Please try again.");
        }
    };

    return (
        <>
            <td>
                <Button variant="warning" size="sm" style={{ fontSize: "9px", margin: '5px' }} onClick={handleShowEditTransactionModal}>
                    <FontAwesomeIcon icon={faPenToSquare} />
                </Button>
                <Button variant="danger" size="sm" onClick={() => onDelete(transaction.transactionDetailsID)} style={{ fontSize: "9px", marginRight: '5px' }}>
                    <FontAwesomeIcon icon={faTrashAlt} />
                </Button>
            </td>

            <EditTransactionModal
                show={showEditTransactionModal}
                handleClose={handleCloseEditTransactionModal}
                handleSubmit={handleSubmitEditTransaction}
                transactionData={editTransactionData}
                handleChange={handleEditTransactionChange}
                setEditTransactionData={setEditTransactionData}
            />
        </>
    );
};

export default BtnEditDeleteTransaction;
