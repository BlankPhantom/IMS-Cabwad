import React from 'react';
import { faPenToSquare, faTrashAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button } from 'react-bootstrap';

const BtnEditDeleteMaster = ({ onEdit, onDelete }) => {
    return (
        <div style={{ display: 'flex', justifyContent: 'center' }}>
            <td>
                <Button variant="warning" size="sm" style={{ fontSize: "9px", margin: '10px' }} onClick={onEdit}><FontAwesomeIcon icon={faPenToSquare} /></Button>
                <Button variant="danger" size="sm" onClick={onDelete} style={{ fontSize: "10px" }}><FontAwesomeIcon icon={faTrashAlt} /></Button>
            </td>
        </div>
    );
};

export default BtnEditDeleteMaster;