import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/HomePage/products.dart';
import 'package:fooddeliveryapp/HomePage/products.dart';
import 'package:fooddeliveryapp/Models/user_profile.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    var product = Product();
    return Scaffold(
=======
    return Scaffold (
>>>>>>> parent of d3b2d0d... minor changes
=======
    return Scaffold (
>>>>>>> parent of d3b2d0d... minor changes
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_basket, color: Colors.white,), onPressed: null), // cart button
          IconButton(icon: Icon(Icons.person, color: Colors.white,), 
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfile()))), // user profile button
        ],
      ),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:Text("Menu",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ))
          ),

          Container(
            height: 400.0,
            child: product,
          )
        ],
      ),
    );
  }
}