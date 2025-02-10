import React, { useState } from "react";

const MonthYearPicker = () => {
    const months = [
        "January", "February", "March", "April", "May", "June", 
        "July", "August", "September", "October", "November", "December"
    ];
    
    const currentDate = new Date();
    const [selectedMonth, setSelectedMonth] = useState(currentDate.getMonth());
    const [selectedYear, setSelectedYear] = useState(currentDate.getFullYear());
    
    const years = Array.from({ length: 50 }, (_, i) => currentDate.getFullYear() - 25 + i);
    
    return (
        <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
            <h2 style={{color: "rgb(71, 71, 71)", fontWeight: '700'}}>{months[selectedMonth]} - {selectedYear}</h2>
            <select value={selectedMonth} onChange={(e) => setSelectedMonth(Number(e.target.value))}>
                {months.map((month, index) => (
                    <option key={index} value={index}>{month}</option>
                ))}
            </select>
            <select value={selectedYear} onChange={(e) => setSelectedYear(Number(e.target.value))}>
                {years.map((year) => (
                    <option key={year} value={year}>{year}</option>
                ))}
            </select>
        </div>
    );
};

export default MonthYearPicker;
