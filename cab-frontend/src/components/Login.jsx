import React from "react";
import { Button, Container, Form } from "react-bootstrap";

const Login = () => {
  const handleLogin = (e) => {
    e.preventDefault();
    // Redirect to Dashboard for testing
    window.location.href = "/dashboard";
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
              <Form.Label className="justify-content-start mt-4 h6 loglbl">
                Username:
              </Form.Label>
              <Form.Control className="login" controlId="logins"></Form.Control>
            </Form.Group>
            <Form.Group
              className="mt-5 mb-5"
              style={{ alignContent: "start", textAlign: "start" }}
            >
              <Form.Label className="justify-content-start h6 loglbl">
                Password:
              </Form.Label>
              <Form.Control
                className="password"
                contolId="passwords"
              ></Form.Control>
            </Form.Group>
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
