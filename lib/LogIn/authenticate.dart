import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/LogIn/sign_in.dart';

class Authenticate extends StatefulWidget {
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}