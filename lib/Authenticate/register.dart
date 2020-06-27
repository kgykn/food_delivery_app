import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 0.0,
          title: Text("Register"),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign in'),
              onPressed: () => widget.toggleView(),
            )
          ],
        ),
        body: Container(
            key: _formKey,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? "Enter a password that's 6+ characters"
                      : null,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child:
                      Text("Register", style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      String email = emailController.text;
                      String password = passwordController.text;

                      print(email);
                      print(password);
                    }
                  },
                ),
              ],
            ))));
  }
}
