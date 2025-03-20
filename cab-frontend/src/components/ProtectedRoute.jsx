import React from "react";
import { Navigate } from "react-router-dom";

const ProtectedRoute = ({ children }) => {
    const token = localStorage.getItem("access_token");
    const isSuperUser = localStorage.getItem("is_superuser") === "true"; // Ensure it's a boolean

    if (!token) {
        return <Navigate to="/" replace />; // Redirect to login if no token
    }

    if (!isSuperUser) {
        return <Navigate to="/dashboardB" replace />; // Redirect non-superusers
    }

    return children; // Allow access if superuser
};

export default ProtectedRoute;
