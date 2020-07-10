import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Admin/admin.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';
import 'package:fooddeliveryapp/Database/productDatabase.dart';
import 'package:fooddeliveryapp/Components/Products/ProductList.dart';
import 'package:fooddeliveryapp/Models/product.dart';
import 'package:fooddeliveryapp/UI/loading.dart';
import 'package:fooddeliveryapp/UserProfile/UserProfile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService authService = AuthService();

  ProductDatabaseService productData = ProductDatabaseService();

  String selectedCategory = "Featured";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('Admin', style: TextStyle(color: Colors.white)),
              onLongPress: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AdminPage()))),
          IconButton(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
              onPressed: null), // cart button
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserProfile()))), // user profile button
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 400.0,
              child: StreamProvider<List<Product>>.value(
                  initialData: List(),
                  value: ProductDatabaseService().products,
                  child: ProductList()))
        ],
      ),
    );
  }
}
