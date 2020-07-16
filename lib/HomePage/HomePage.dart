import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Admin/admin.dart';
import 'package:fooddeliveryapp/Authenticate/auth.dart';
import 'package:fooddeliveryapp/Database/productDatabase.dart';
import 'package:fooddeliveryapp/Components/Products/ProductList.dart';
import 'package:fooddeliveryapp/Models/product.dart';
import 'package:fooddeliveryapp/ShoppingCart/ShoppingCart.dart';
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
              onPressed: () {},
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
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShoppingCart()))), // cart button
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
          viewCategorySelection(),
          viewProductByCategory(selectedCategory),
        ],
      ),
    );
  }

  Widget viewCategorySelection() {
    return Container(
        height: 60.0,
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("categories").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                const Text("Loading.....");
              else {
                List<DropdownMenuItem> categoryDropdownMenuItems = [];
                categoryDropdownMenuItems.add(DropdownMenuItem(
                  child: Text("Featured"),
                  value: "Featured",
                ));
                for (int i = 0; i < snapshot.data.documents.length; i++) {
                  DocumentSnapshot snap = snapshot.data.documents[i];
                  categoryDropdownMenuItems.add(DropdownMenuItem(
                    child: Text(
                      snap.data['name'],
                    ),
                    value: "${snap.data['name']}",
                  ));
                }
                return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      DropdownButton(
                        items: categoryDropdownMenuItems,
                        onChanged: (item) {
                          setState(() {
                            selectedCategory = item;
                          });
                        },
                        value: selectedCategory,
                        isExpanded: false,
                        hint: Text("Choose Category"),
                      )
                    ]);
              }
            }));
  }

  Widget viewProductByCategory(String selectedCategory) {
    if (selectedCategory == 'Featured')
      return Container(
          height: 400,
          child: StreamProvider<List<Product>>.value(
              initialData: List(),
              value: productData.featuredProducts,
              child: ProductList()));
    else
      return Container(
          height: 400,
          child: StreamProvider<List<Product>>.value(
            initialData: List(),
            value: productData.getProductByCategory(selectedCategory),
            child: ProductList(),
          ));
  }
}
