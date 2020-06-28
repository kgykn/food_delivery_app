import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final AuthService _auth = AuthService();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          elevation: 0.0,
          title: Text("Sign in"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.deepOrangeAccent,
                  child: Text("Sign in", style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;

                    print(email);
                    print(password);
                  },
                )
              ],
            ))));
  }
}
