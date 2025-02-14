import React, { useState } from 'react';
import { faPenToSquare, faTrashAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button } from 'react-bootstrap';
import EditTransactionModal from '../Modals/EditTransactionModal';

const BtnEditDeleteTransaction = ({ onEdit, onDelete, transaction }) => {
    const [showEditTransactionModal, setShowEditTransactionModal] = useState(false);
    const [editTransactionData, setEditTransactionData] = useState(transaction);

    const handleShowEditTransactionModal = () => setShowEditTransactionModal(true);
    const handleCloseEditTransactionModal = () => setShowEditTransactionModal(false);

    const handleEditTransactionChange = (e) => {
        const { name, value } = e.target;
        setEditTransactionData({ ...editTransactionData, [name]: value });
    };

    const handleSubmitEditTransaction = (e) => {
        e.preventDefault();
        onEdit(editTransactionData);
        handleCloseEditTransactionModal();
    };

    return (
        <>
            <td>
                <Button variant="warning" size="sm" style={{ fontSize: "9px", margin: '10px' }} onClick={handleShowEditTransactionModal}>
                    <FontAwesomeIcon icon={faPenToSquare} />
                </Button>
                <Button variant="danger" size="sm" onClick={onDelete} style={{ fontSize: "10px" }}>
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