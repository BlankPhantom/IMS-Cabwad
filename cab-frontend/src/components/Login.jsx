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
    const rememberedUsername = localStorage.getItem("rememberedUsername");
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
      console.log("API Response:", data); // Debugging the API response

      if (response.ok) {
        if (data.token && data.user) {
          localStorage.setItem("access_token", data.token);
          localStorage.setItem("id", data.user.id);
          localStorage.setItem("is_superuser",JSON.stringify(data.user.is_superuser));
          localStorage.setItem("is_staff", JSON.stringify(data.user.is_staff));

          console.log("Stored in localStorage:", {
            token: data.token,
            is_superuser: localStorage.getItem("is_superuser"),
            is_staff: localStorage.getItem("is_staff"),
          });

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
        console.error("Login error details:", data);
      }
    } catch (error) {
      console.error("Error during login:", error);
      alert("An error occurred. Please try again later.");
    }
  };

  return (
    <div
      style={{
        backgroundColor: "#005ce5",
      }}>
      <Container
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          height: "100vh",
        }}>
        <div className="loginDiv">
          <Form onSubmit={handleLogin}>
            <Form.Label
              className="cabWad"
              style={{ fontSize: "2rem", fontWeight: "bold" }}>
              Cabuyao Water District
            </Form.Label>
            <p
              className="ims"
              style={{ fontSize: "1.2rem", marginBottom: "2rem" }}>
              Inventory Management System
            </p>
            <Form.Group style={{ alignContent: "start", textAlign: "start" }}>
              <Form.Label className="justify-content-start mt-4 h6 loglbl">
                {" "}
                Username:{" "}
              </Form.Label>
              <Form.Control
                className="login"
                controlId="txtUsername"
                type="text"
                placeholder="Enter your username here"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                style={{
                  width: "93%",
                  padding: "0.75rem",
                  borderRadius: "5px",
                }}
              />
              {errors.txtUsername && (
                <p style={{ color: "red" }}>{errors.txtUsername}</p>
              )}
            </Form.Group>
            <Form.Group
              className="mt-5 mb-5"
              style={{ alignContent: "start", textAlign: "start" }}>
              <Form.Label className="justify-content-start h6 loglbl">
                Password:
              </Form.Label>
              <div style={{ display: "flex", alignItems: "center" }}>
                <Form.Control
                  type={showPassword ? "text" : "password"}
                  placeholder="Insert your Password here"
                  value={password}
                  className="password"
                  controlId="txtPassword"
                  onChange={(e) => setPassword(e.target.value)}
                  style={{
                    marginRight: "10px",
                    padding: "0.75rem",
                    borderRadius: "5px",
                  }}
                />
                <Button
                  variant="primary"
                  onClick={togglePasswordVisibility}
                  style={{ padding: "0.5rem 1rem" }}>
                  <FontAwesomeIcon icon={showPassword ? faEyeSlash : faEye} />
                </Button>
              </div>
              {errors.txtPassword && (
                <p style={{ color: "red" }}>{errors.txtPassword}</p>
              )}
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
              <Button
                variant="warning"
                className="text-white shadow"
                style={{ fontWeight: "bold", width: "10em" }}
                type="submit">
                {" "}
                Login{" "}
              </Button>
            </div>
          </Form>
        </div>
      </Container>
    </div>
  );
};

export default Login;
