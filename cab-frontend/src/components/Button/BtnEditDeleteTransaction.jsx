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
        setEditTransactionData((prevData) => ({
            ...prevData,
            [name]: value,
        }));
    };

    // const handleSubmitEditTransaction = async (e) => {
    //     e.preventDefault();

    //     try {
    //         const response = await fetch(API_ENDPOINTS.UPDATE_TRANSACTION(editTransactionData.transactionDetailsID), {
    //             method: "PUT",
    //             headers: {
    //                 "Content-Type": "application/json",
    //                 "Authorization": `Token ${localStorage.getItem("access_token")}`,
    //             },
    //             body: JSON.stringify(editTransactionData),
    //         });

    //         if (!response.ok) {
    //             throw new Error("Failed to update transaction");
    //         }

    //         // Next, add new products to the transaction
    //         for (const product of localProducts) {
    //             const productPayload = {
    //                 ...product,
    //                 transactionDetailsID: transactionData.transactionDetailsID,
    //             };

    //             const productResponse = await fetch(API_ENDPOINTS.ADD_TRANSACTION_PRODUCT, {
    //                 method: "POST",
    //                 headers: {
    //                     "Content-Type": "application/json",
    //                     Authorization: `Token ${token}`,
    //                 },
    //                 body: JSON.stringify(productPayload),
    //             });

    //             if (!productResponse.ok) throw new Error("Failed to add product");
    //         }

    //         const updatedTransaction = await response.json();
    //         onUpdate(updatedTransaction); // Update UI with new transaction data

    //         alert("Transaction and products have been successfully updated!"); // ✅ Success message
    //         fetchTransactionsWithProducts(); // ✅ Refresh transaction list

    //         handleCloseEditTransactionModal();
    //     } catch (error) {
    //         console.error("Error updating transaction:", error);
    //         alert("Error updating transaction. Please try again.");
    //     }
    // };

    return (
        <>

            <Button variant="warning" size="sm" style={{ fontSize: "9px", margin: '5px' }} onClick={handleShowEditTransactionModal}>
                <FontAwesomeIcon icon={faPenToSquare} />
            </Button>
            <Button variant="danger" size="sm" onClick={() => onDelete(transaction.transactionDetailsID)} style={{ fontSize: "9px", marginRight: '5px' }}>
                <FontAwesomeIcon icon={faTrashAlt} />
            </Button>


            <EditTransactionModal
                show={showEditTransactionModal}
                handleClose={handleCloseEditTransactionModal}
                // handleSubmit={handleSubmitEditTransaction}
                transactionData={editTransactionData}
                handleChange={handleEditTransactionChange}
                setEditTransactionData={setEditTransactionData}
                handleShow={handleShowEditTransactionModal}
            />
        </>
    );
};

export default BtnEditDeleteTransaction;
