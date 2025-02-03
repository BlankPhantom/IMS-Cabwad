import React from "react";
import { Button, Container, Form } from "react-bootstrap";

const Login = () => {
  return (
    <Container>
      <div className="mt-5 loginDiv">
        <Form>
          <Form.Label className="cabWad">Cabuyao Water District</Form.Label>
          <p className="ims">Inventory Management System</p>
          <Form.Group style={{ alignContent: "start", textAlign: "start" }}>
            <Form.Label className="justify-content-start text-white mt-4 h6">
              Username:
            </Form.Label>
            <Form.Control className="login" controlId="email"></Form.Control>
          </Form.Group>
          <Form.Group
            className="mt-5 mb-5"
            style={{ alignContent: "start", textAlign: "start" }}
          >
            <Form.Label className="justify-content-start text-white h6">
              Password:
            </Form.Label>
            <Form.Control
              className="password"
              contolId="passwords"
            ></Form.Control>
          </Form.Group>
          <div className="loginbtn">
            <Button variant="warning" className="text-white" style={{fontWeight: "bold", width: "10em"}} type="submit"> Login </Button>
          </div>
        </Form>
      </div>
    </Container>
  );
};

export default Login;
