import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { useState, useEffect } from "react";
import { Button, Container, Form } from "react-bootstrap";
import Logo from "/src/assets/cabwadLogo.png";
import CabFooter from "./CabFooter";
import { API_ENDPOINTS } from "../config";
import { faEye, faEyeSlash, faUser, faLock } from "@fortawesome/free-solid-svg-icons";

const Login = () => {
  const [username, setUsername] = useState();
  const [password, setPassword] = useState();
  const [showPassword, setShowPassword] = useState(false);
  const [errors, setErrors] = useState(false);

  const togglePasswordVisibility = () => setShowPassword(!showPassword);

  const validateLogin = () => {
    const newErrors = {};

    if (!username) newErrors.txtUsername = "Enter your username";
    if (!password) newErrors.txtPassword = "Enter your password";

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleLogin = async (e) => {
    e.preventDefault();
    if (!validateLogin()) return;

    const loginData = { username, password };

    try {
      const response = await fetch(API_ENDPOINTS.LOGIN, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(loginData),
      });

      const data = await response.json();

      if (response.ok) {
        if (data.token && data.user) {
          localStorage.setItem("access_token", data.token);
          localStorage.setItem("id", data.user.id);
          localStorage.setItem("is_superuser", JSON.stringify(data.user.is_superuser));
          localStorage.setItem("is_staff", JSON.stringify(data.user.is_staff));

          if (data.user.is_superuser) {
            window.location.href = "/dashboard";
          } else {
            window.location.href = "/dashboardB";
          }
        } else {
          console.error("Login failed: Missing user data", data);
        }
      } else {
        setErrors({
          txtUsername: "Incorrect login details",
          txtPassword: "Incorrect login details",
        });
      }
    } catch (error) {
      console.error("Error during login:", error);
      alert("An error occurred. Please try again later.");
    }
  };

  return (
    <div
      style={{
        background: '#0041a8',
        minHeight: '100vh',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        padding: '20px'
      }}
    >
      <Container
        style={{
          maxWidth: '500px',
          width: '100%',
        }}
      >
        <div
          className="loginDiv shadow-lg"
          style={{
            backgroundColor: 'white',
            borderRadius: '15px',
            padding: '40px',
            boxShadow: '0 10px 25px rgba(0,0,0,0.1)',
            transition: 'transform 0.3s ease',
            position: 'relative',
          }}
        >
          <Form onSubmit={handleLogin}>
            <div className="logoDiv text-center mb-4">
              <img
                className="logo img-fluid mb-3"
                src={Logo}
                alt="Cabuyao Water District"
                style={{
                  height: "100px",
                  marginBottom: "15px"
                }}
              />
              <h1
                className="cabWad"
                style={{
                  fontSize: "1.8rem",
                  fontWeight: "bold",
                  color: "#0041a8",
                  marginBottom: "10px"
                }}
              >
                Cabuyao Water District
              </h1>
              <p
                className="ims"
                style={{
                  fontSize: "1rem",
                  color: "#6c757d",
                  marginBottom: "20px"
                }}
              >
                Inventory Management System
              </p>
            </div>

            <Form.Group className="mb-3">
              <div style={{ position: 'relative' }}>
                <FontAwesomeIcon
                  icon={faUser}
                  style={{
                    position: 'absolute',
                    left: '15px',
                    top: '50%',
                    transform: 'translateY(-50%)',
                    color: '#0041a8'
                  }}
                />
                <Form.Control
                  className="login ps-5"
                  type="text"
                  placeholder="Username"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  style={{
                    height: "3rem",
                    borderRadius: "25px",
                    paddingLeft: "45px",
                    border: errors.txtUsername ? '2px solid red' : '1px solid #ced4da'
                  }}
                />
              </div>
              {errors.txtUsername && (
                <p style={{ color: "red", marginTop: "5px", fontSize: "0.9rem" }}>
                  {errors.txtUsername}
                </p>
              )}
            </Form.Group>

            <Form.Group className="mb-3">
              <div style={{ position: 'relative' }}>
                <FontAwesomeIcon
                  icon={faLock}
                  style={{
                    position: 'absolute',
                    left: '15px',
                    top: '50%',
                    transform: 'translateY(-50%)',
                    color: '#0041a8'
                  }}
                />
                <Form.Control
                  type={showPassword ? "text" : "password"}
                  placeholder="Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  style={{
                    height: "3rem",
                    borderRadius: "25px",
                    paddingLeft: "45px",
                    paddingRight: "50px",
                    border: errors.txtPassword ? '2px solid red' : '1px solid #ced4da'
                  }}
                />
                <Button
                  variant="link"
                  onClick={togglePasswordVisibility}
                  style={{
                    position: 'absolute',
                    right: '15px',
                    top: '50%',
                    transform: 'translateY(-50%)',
                    color: '#0041a8'
                  }}
                >
                  <FontAwesomeIcon icon={showPassword ? faEyeSlash : faEye} />
                </Button>
              </div>
              {errors.txtPassword && (
                <p style={{ color: "red", marginTop: "5px", fontSize: "0.9rem" }}>
                  {errors.txtPassword}
                </p>
              )}
            </Form.Group>

            <div className="text-center mt-4">
              <Button
                variant="primary"
                type="submit"
                style={{
                  width: "200px",
                  height: "3rem",
                  borderRadius: "25px",
                  backgroundColor: '#0041a8',
                  border: 'none',
                  fontWeight: 'bold',
                  transition: 'transform 0.2s ease, box-shadow 0.2s ease'
                }}
                className="hover-effect"
              >
                Login
              </Button>
            </div>
          </Form>
        </div>
      </Container>
      <CabFooter />
    </div>
  );
};

export default Login;