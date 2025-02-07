import React, { useState } from "react";
import { Row, Col, Container } from "react-bootstrap";
import Masterlist from "../Sections/MasterList";
import TopNav  from "../TopNav"
import BeginningBalance from "../Sections/BeginningBalance";
import Transactions from "../Sections/Transactions";
import RunningBalance from "../Sections/RunningBalance";

const DashBoard = () => {
    return (
        <div>
            <TopNav/>
            {/* <Masterlist/> */}
            {/* <BeginningBalance/> */}
            {/* <Transactions/> */}
            <RunningBalance/>
            {/* <MonthlyConsumption/> */}
            {/* <SummaryReport/> */}
        </div>
    );
};

export default DashBoard;