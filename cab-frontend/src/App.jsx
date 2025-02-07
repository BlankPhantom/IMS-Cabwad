import React from 'react';
import './App.css';
import Login from './components/Login.jsx';
import Masterlist from './components/Sections/MasterList.jsx';
import DashBoard from './components/MainPages/DashBoard.jsx';

const App = () => {
  return (
    <div>
      <DashBoard/>
      {/* <Login/> */}
    </div>
  );
}

export default App;
