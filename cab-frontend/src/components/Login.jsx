import React from "react";
import {Button, Container, Form} from 'react-bootstrap';

const Login = () => {
    return(
        <Container>
            <Form>
                <Form.Label>LOGIN</Form.Label>
                <Form.Group style={{alignContent: 'start', textAlign: 'start'}}>
                    <Form.Label className="justify-content-start">Email address:</Form.Label>
                    <Form.Control controlId='email'></Form.Control>
                </Form.Group>
                <Form.Group className="mt-5 mb-5    " style={{alignContent: 'start', textAlign: 'start'}}>
                    <Form.Label className="justify-content-start">Password:</Form.Label>
                    <Form.Control contolId='passwords'></Form.Control>
                </Form.Group>
                <Button type='submit'> Login </Button>
                
            </Form>
            <a className='' href="">Register as an Evaluator</a>
        </Container>
    );
};

export default Login;