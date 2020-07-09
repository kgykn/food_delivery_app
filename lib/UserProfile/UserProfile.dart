import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);
                },
                child: Text("Sign out",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                color: Colors.deepOrangeAccent,
              ),
            )
          ],
        ));
  }
}
