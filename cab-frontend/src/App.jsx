import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import DashBoard from "./components/MainPages/DashBoard";
import Masterlist from "./components/Sections/MasterList";
import BeginningBalance from "./components/Sections/BeginningBalance";
import Transactions from "./components/Sections/Transactions";
import RunningBalance from "./components/Sections/RunningBalance";
import MonthlyConsumption from "./components/Sections/MonthlyConsumption";
import SummaryReport from "./components/Sections/SummaryReport";
import Login from "./components/Login";

const App = () => {
    return (
        <Router>
            <Routes>
                {/* Set Login as the default route */}
                <Route path="/" element={<Login />} />
                <Route path="/dashboard" element={<DashBoard />}>
                    <Route index element={<Masterlist />} />
                    <Route path="masterlist" element={<Masterlist />} />
                    <Route path="beginning-balance" element={<BeginningBalance />} />
                    <Route path="transactions" element={<Transactions />} />
                    <Route path="running-balance" element={<RunningBalance />} />
                    <Route path="monthly-consumption" element={<MonthlyConsumption />} />
                    <Route path="summary-report" element={<SummaryReport />} />
                </Route>
            </Routes>
        </Router>
    );
};

export default App;