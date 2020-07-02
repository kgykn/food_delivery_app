import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddeliveryapp/HomePage/product_details.dart';
import 'package:fooddeliveryapp/UI/loading.dart';

class Product extends StatefulWidget {
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("products").snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: Loading())
            : ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.documents[index];
                  return ProductGrid(
                      documentSnapshot: data,
                      id: data.documentID,
                      imageUrl: data['imageUrl'],
                      name: data['name'],
                      description: data['description'],
                      price: data['price']);
                });
      },
    );
  }
}

class ProductGrid extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;
  final String description;
  final String id;
  final DocumentSnapshot documentSnapshot;

  ProductGrid(
      {this.name,
      this.imageUrl,
      this.price,
      this.description,
      this.id,
      this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: name,
            child: Material(
                child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              pd_name: name,
                              pd_price: price,
                              pd_description: description,
                              pd_picture_location: imageUrl,
                            ))),
                    child: GridTile(
                      footer: Container(
                        height: 60.0,
                        color: Colors.white70,
                        child: ListTile(
                            title: Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12.0),
                            ),
                            subtitle: Text(
                              "$price",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      child: Image.network(imageUrl, fit: BoxFit.cover),
                    )))));
  }
}
