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
