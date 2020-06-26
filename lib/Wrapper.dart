import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/HomePage/homepage.dart';
import 'package:fooddeliveryapp/Authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:fooddeliveryapp/Models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
