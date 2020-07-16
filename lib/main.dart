import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Models/cart.dart';
import 'package:fooddeliveryapp/Models/user.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';
import 'package:fooddeliveryapp/Wrapper.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp(model: CartModel()));

class MyApp extends StatelessWidget {
  final CartModel model;
  const MyApp({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        catchError: (_, ___) => null,
        value: AuthService().user,
        child: ScopedModel(
          model: model,
          child: MaterialApp(
            home: Wrapper(),
            debugShowCheckedModeBanner: false,
          ),
        ));
  }
}
