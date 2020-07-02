import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddeliveryapp/HomePage/product_details.dart';
<<<<<<< HEAD
import 'package:fooddeliveryapp/UI/loading.dart';

class Product extends StatefulWidget {
=======
class Product extends StatefulWidget{
>>>>>>> parent of 9546992... minor changes
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return ProductGrid(
          prod_name: product_list[index]["name"],
          prod_picture_location: product_list[index]["picture_location"],
          prod_price: product_list[index]["price"],
          prod_description: product_list[index]["description"],
        );
>>>>>>> parent of 9546992... minor changes
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

<<<<<<< HEAD
  ProductGrid(
      {this.name,
      this.imageUrl,
      this.price,
      this.description,
      this.id,
      this.documentSnapshot});
=======
  ProductGrid({
    this.prod_name,
    this.prod_picture_location,
    this.prod_price,
    this.prod_description
  });
>>>>>>> parent of 9546992... minor changes

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: name,
            child: Material(
                child: InkWell(
<<<<<<< HEAD
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              pd_name: name,
                              pd_price: price,
                              pd_description: description,
                              pd_picture_location: imageUrl,
                            ))),
=======
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(
                      pd_name: prod_name,
                      pd_price: prod_price,
                      pd_description: prod_description,
                      pd_picture_location: prod_picture_location,
                    ))),
>>>>>>> parent of 9546992... minor changes
                    child: GridTile(
                      footer: Container(
                        height: 55.0,
                        color: Colors.white70,
                        child: ListTile(
<<<<<<< HEAD
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
=======
                            title: Text(prod_name, style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0
                            ),
                            ),
                            subtitle: Text("$prod_price", style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            )
                        ),
                      ),
                      child: Image.asset(prod_picture_location,
                          fit: BoxFit.cover),
                    )
                )
            )
        ));
>>>>>>> parent of 9546992... minor changes
  }
}