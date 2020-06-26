import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/LogIn/auth.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>
{
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0.0,
        title: Text("Sign in"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text("Sign in anonymously"),
          onPressed: () async {
            dynamic result = await _auth.signinAnon();
            if (result == null)
              {
                print("Error signing in");
              }
            else {
              print("Signed in");
              print(result);
            }
          },
        )
      )
    );
  }
}