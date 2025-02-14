import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { useState, useEffect } from "react";
import { Button, Container, Form } from "react-bootstrap";
import { API_ENDPOINTS } from "../config";
import { faEye, faEyeSlash } from "@fortawesome/free-solid-svg-icons";

const Login = () => {
  const [username, setUsername] = useState();
  const [password, setPassword] = useState();
  const [showPassword, setShowPassword] = useState(false);
  const [rememberMe, setRememberMe] = useState(false);
  const [errors, setErrors] = useState(false);

  const togglePasswordVisibility = () => setShowPassword(!showPassword);
  
  useEffect(() => {
    const rememberedUsername = localStorage.getItem('rememberedUsername');
    if (rememberedUsername) {
      setUsername(rememberedUsername);
      setRememberMe(true);
    }
  }, []);
  
  const validateLogin = () => {
    const newErrors = {};
    
    if (!username) newErrors.txtUsername = "Enter your username";
    if (!password) newErrors.txtPassword = "Enter your password";
    
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  }
  
  const handleLogin = async (e) => {
    e.preventDefault();
    if (!validateLogin()) return;

    const loginData = { username, password };

    try {
      const response = await fetch(API_ENDPOINTS.LOGIN, {  
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(loginData),
      });

      if (response.ok) {
        const data = await response.json();
        
        localStorage.setItem('access_token', data.token);
        localStorage.setItem('user_id', data.user_id);
        
        window.location.href = "/dashboard";
      } else {
        setErrors({
          txtUsername: 'Incorrect login details',
          txtPassword: 'Incorrect login details',
        });
        console.error('Login error details:', await response.json());
      }
    } catch (error) {
      console.error('Error during login:', error);
      alert('An error occurred. Please try again later.');
    }
  };

  
  return (
    <div style={{
      backgroundColor: '#005ce5'
    }}>
      <Container style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
      }}>
      <div className="loginDiv shadow-lg">
        <Form onSubmit={handleLogin}>
          <Form.Label className="cabWad">
          Cabuyao Water District
          </Form.Label>
          <p className="ims">Inventory Management System</p>
            <Form.Group style={{ alignContent: "start", textAlign: "start" }}>
              <Form.Label className="justify-content-start mt-4 h6 loglbl"> Username: </Form.Label>
              <Form.Control 
                className="login" 
                controlId="txtUsername" 
                type="text" 
                placeholder='Enter your username here' 
                value={username} 
                onChange={(e) => setUsername(e.target.value)}>
              </Form.Control>
            </Form.Group>
            <Form.Group className="mt-5 mb-5" style={{ alignContent: "start", textAlign: "start" }}>
              <Form.Label className="justify-content-start h6 loglbl">
              Password:
              </Form.Label>
              <Form.Control
                type={showPassword ? 'text' : 'password'}
                placeholder='Insert your Password here'
                value={password}
                className="password"
                contolId="txtPassword"
                onChange={(e) => setPassword(e.target.value)}
              ></Form.Control>
              <Button variant='success' onClick={togglePasswordVisibility}>
                <FontAwesomeIcon icon={showPassword ? faEyeSlash : faEye} />
              </Button>
            </Form.Group>
            {/* <Form.Group as={Col} className="mb-3 ps-5" controlId="CheckBox">
                <Form.Check
                    type="checkbox"
                    label="Remember Me"
                    checked={rememberMe}
                    onChange={(e) => setRememberMe(e.target.checked)}
                />
            </Form.Group> */}
          <div className="loginbtn">
            <Button variant="warning" className="text-white shadow" style={{ fontWeight: "bold", width: "10em" }} type="submit"> Login </Button>
          </div>
        </Form>
      </div>
      </Container>
    </div>
  );
};

export default Login;
