import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';
import 'package:fooddeliveryapp/UI/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController repeatPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    final RegExp nameRegExp = RegExp('[a-zA-Z]');

    String error = '';
    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();
    bool _isLoading = false;

    return _isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepOrangeAccent,
                elevation: 0.0,
                title: Text("Register"),
                actions: <Widget>[
                  FlatButton.icon(
                      icon: Icon(Icons.person, color: Colors.white),
                      label: Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => widget.toggleView())
                ]),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(hintText: "Your name"),
                            validator: (value) => value.isEmpty
                                ? 'Enter your name'
                                : nameRegExp.hasMatch(value)
                                    ? null
                                    : 'Enter a valid name'),
                        SizedBox(height: 10.0),
                        TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(hintText: "Email"),
                            validator: (value) => EmailValidator.validate(value)
                                ? null
                                : "Invalid email address"),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(hintText: "Password"),
                          validator: (value) => value.length < 6
                              ? 'Password must be 6+ characters long'
                              : null,
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: repeatPasswordController,
                          obscureText: true,
                          decoration:
                              InputDecoration(hintText: "Repeat password"),
                          validator: (value) => value.length < 6
                              ? 'Invalid password'
                              : value == passwordController.text
                                  ? null
                                  : 'Password does not match',
                        ),
                        SizedBox(height: 20.0),
                        RaisedButton(
                          color: Colors.deepOrangeAccent,
                          child: Text("Register",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            String email = emailController.text;
                            String password = passwordController.text;
                            if (_formKey.currentState.validate()) {
                              _isLoading = true;
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Please enter a valid email';
                                  _isLoading = false;
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          error,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    ))));
  }
}
