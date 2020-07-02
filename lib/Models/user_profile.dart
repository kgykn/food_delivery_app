import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';
import 'package:fooddeliveryapp/Database/UserDatabase.dart';

class UserProfile extends StatefulWidget {
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ListView(
          children: <Widget>[
            MaterialButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
              child: Text("Sign out",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.deepOrangeAccent,
            )
          ],
        ));
  }
}
