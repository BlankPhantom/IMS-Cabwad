import React, { useState } from "react";

const MonthYearPicker = ({ onMonthYearChange }) => {
    const months = [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    const currentDate = new Date();
    const [selectedMonth, setSelectedMonth] = useState(currentDate.getMonth()); // Adjust for "All"
    const [selectedYear, setSelectedYear] = useState(currentDate.getFullYear());

    const years = Array.from({ length: 50 }, (_, i) => currentDate.getFullYear() - 25 + i);

    const handleMonthChange = (e) => {
        const month = Number(e.target.value);
        setSelectedMonth(month);
        onMonthYearChange(month, selectedYear);
    };

    const handleYearChange = (e) => {
        const year = Number(e.target.value);
        setSelectedYear(year);
        onMonthYearChange(selectedMonth, year);
    };

    return (
        <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <select style={{ padding: '3px', borderRadius: '4px', border: '.5px solid rgb(212, 212, 212)' }} value={selectedMonth} onChange={handleMonthChange}>
                {months.map((month, index) => (
                    <option key={index} value={index}>{month}</option>
                ))}
            </select>
            <select style={{ padding: '3px', borderRadius: '4px', border: '.5px solid rgb(212, 212, 212)' }} value={selectedYear} onChange={handleYearChange}>
                {years.map((year) => (
                    <option key={year} value={year}>{year}</option>
                ))}
            </select>
        </div>
    );
};

export default MonthYearPicker;
