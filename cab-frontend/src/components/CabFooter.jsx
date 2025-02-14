import React from "react";
import { Container } from "react-bootstrap";

const CabFooter = () => {
    return (
        <footer 
            style={{ 
                backgroundColor: "#FFB600", 
                padding: "8px 0", 
                textAlign: "center",
                position: "fixed",
                bottom: 0,
                left: 0,
                width: "100%",
            }}
        >
            <Container>
                <p style={{ margin: 0, fontWeight: "bold", fontSize: "12px", marginRight: '5px' }}>
                     COPYRIGHT © 2025 |  
                    <a 
                        style={{ color: "blue", textDecoration: "none", fontWeight: "bold", marginRight: '5px', marginLeft: '5px'}}
                    >
                        CABUYAO WATER DISTRICT
                    </a> 
                     ALL RIGHTS RESERVED
                </p>
            </Container>
        </footer>
    );
};

export default CabFooter;
