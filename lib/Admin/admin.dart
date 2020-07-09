import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Admin/AddCategory.dart';
import 'package:fooddeliveryapp/Admin/AddProduct.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: Text(
              'Admin Page',
              style: TextStyle(color: Colors.white),
            )),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddProduct())),
                child: Text("Add product",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                color: Colors.deepOrangeAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddCategory())),
                child: Text("Add category",
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
