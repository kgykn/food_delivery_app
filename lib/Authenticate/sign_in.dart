import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';
import 'package:fooddeliveryapp/UI/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                title: Text("Log in"),
                actions: <Widget>[
                  FlatButton.icon(
                      icon: Icon(Icons.person, color: Colors.white),
                      label: Text('Register',
                          style: TextStyle(color: Colors.white)),
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
                        SizedBox(height: 20.0),
                        RaisedButton(
                          color: Colors.deepOrangeAccent,
                          child: Text("Log In",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            String email = emailController.text;
                            String password = passwordController.text;
                            if (_formKey.currentState.validate()) {
                              setState(() => _isLoading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Can\'t log in.';
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
