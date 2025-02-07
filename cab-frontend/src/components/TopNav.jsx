import React, { useState, useEffect } from 'react';
import '../App.css';
import { Navbar, NavLink } from 'react-bootstrap';
import Logo from '/src/assets/cabwadLogo.png'

const TopNav = () => {
    return (
        <div className='topNav'>
            <Navbar style={{
                backgroundColor: "#005ce5",
                display: "flex", justifyContent: "space-between", alignItems: "center", padding: "10px"
            }}>
                <NavLink style={{
                    backgroundColor: 'transparent'
                }}>
                    <img className='logo img-fluid' src={Logo} alt="cabwadLogo" />
                </NavLink>

                <ul className='mt-3' style={{ display: "flex", listStyle: "none", padding: 0 }}>
                    <li className='mt-3' style={{ marginRight: "10px" }}>
                        <NavLink style={{ color: 'white', fontWeight: '600', fontSize: '17px' }}>MASTERLIST</NavLink>
                    </li>
                    <li style={{ marginRight: "10px" }}>
                        <NavLink style={{ color: 'white', fontWeight: '600', fontSize: '17px', wordWrap: 'break-word', textAlign: 'center', maxWidth: '150px' }}>BEGINNING BALANCE</NavLink>
                    </li>
                    <li className='mt-3' style={{ marginRight: "10px" }}>
                        <NavLink style={{ color: 'white', fontWeight: '600', fontSize: '17px' }}>TRANSACTIONS</NavLink>
                    </li>
                    <li style={{ marginRight: "10px" }}>
                        <NavLink style={{ color: 'white', fontWeight: '600', fontSize: '17px', wordWrap: 'break-word', textAlign: 'center', maxWidth: '150px' }}>RUNNING BALANCE</NavLink>
                    </li>
                    <li style={{ marginRight: "10px" }}>
                        <NavLink style={{ color: 'white', fontWeight: '600', fontSize: '17px', wordWrap: 'break-word', textAlign: 'center', maxWidth: '150px' }}>MONTHLY CONSUMPTION</NavLink>
                    </li>
                    <li style={{ marginRight: "10px" }}>
                        <NavLink style={{ color: 'white', fontWeight: '600', fontSize: '17px', wordWrap: 'break-word', textAlign: 'center', maxWidth: '150px' }}>SUMMARY REPORT</NavLink>
                    </li>
                </ul>

                <div>
                    <NavLink style={{ color: 'white', fontWeight: '600', fontSize: '19px', marginRight: '20px' }}>
                        Logout
                    </NavLink>
                </div>
            </Navbar>
        </div>
    );
};

export default TopNav;