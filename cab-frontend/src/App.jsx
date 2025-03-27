import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import DashBoard from "./components/MainPages/DashBoard";
import DashBoardB from "./components/MainPages/DashboardB";
import Masterlist from "./components/Sections/MasterList";
import BeginningBalance from "./components/Sections/BeginningBalance";
import Transactions from "./components/Sections/Transactions";
import RunningBalance from "./components/Sections/RunningBalance";
import MonthlyConsumption from "./components/Sections/MonthlyConsumption";
import Login from "./components/Login";
import WeeklyConsumption from "./components/Sections/WeeklyConsumption";
import BackupRestore from "./components/Sections/BackupRestore";
import AccManagement from "./components/Sections/AccManagement";
import MyProfile from "./components/Sections/MyProfile";
import ProtectedRoute from "./components/ProtectedRoute"; // Import Protected Route

const App = () => {
    return (
        <Router>
            <Routes>
                {/* Default login route */}
                <Route path="/" element={<Login />} />

                {/* Protect dashboard for superusers */}
                <Route path="/dashboard" element={
                    <ProtectedRoute>
                        <DashBoard />
                    </ProtectedRoute>
                }>
                    <Route index element={<Masterlist />} />
                    <Route path="masterlist" element={<Masterlist />} />
                    <Route path="beginning-balance" element={<BeginningBalance />} />
                    <Route path="transactions" element={<Transactions />} />
                    <Route path="running-balance" element={<RunningBalance />} />
                    <Route path="monthly-consumption" element={<MonthlyConsumption />} />
                    <Route path="weekly-consumption" element={<WeeklyConsumption />} />
                    <Route path="account-management" element={<AccManagement />} />
                    <Route path="backup-restore" element={<BackupRestore />} />
                    <Route path="my-profile" element={<MyProfile />} />   
                </Route>

                {/* Non-superusers default to DashboardB */}
                <Route path="/dashboardB" element={<DashBoardB />}>
                    <Route index element={<Masterlist />} />
                    <Route path="masterlist" element={<Masterlist />} />
                    <Route path="beginning-balance" element={<BeginningBalance />} />
                    <Route path="transactions" element={<Transactions />} />
                    <Route path="running-balance" element={<RunningBalance />} />
                    <Route path="monthly-consumption" element={<MonthlyConsumption />} />
                    <Route path="weekly-consumption" element={<WeeklyConsumption />} />
                    <Route path="my-profile" element={<MyProfile />} />   
                </Route>           
            </Routes>
        </Router>
    );
};

export default App;
