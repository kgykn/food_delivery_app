import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: null), // search button
          IconButton(icon: Icon(Icons.shopping_basket, color: Colors.white,), onPressed: null), // cart button
          IconButton(icon: Icon(Icons.person, color: Colors.white,), onPressed: null) // user profile button
        ],
      ),

      
    )
  }
}