import React from 'react';
import { faClipboard, faPenToSquare, faTrashAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button } from 'react-bootstrap';

const BtnEditDeleteMaster = ({ onEdit, onDelete, onViewHistory }) => {
    return (
        <div className="d-flex gap-2">
            <Button variant="info" size="sm" style={{fontSize: '9px'}} onClick={onViewHistory}>
                <FontAwesomeIcon icon={faClipboard} /> 
            </Button>
            <Button variant="primary" size="sm" style={{fontSize: '9px'}} onClick={onEdit}>
                <FontAwesomeIcon icon={faPenToSquare} /> 
            </Button>
            <Button variant="danger" size="sm" style={{fontSize: '9px'}} onClick={onDelete}>
                <FontAwesomeIcon icon={faTrashAlt} /> 
            </Button>
        </div>
    );
};

export default BtnEditDeleteMaster;