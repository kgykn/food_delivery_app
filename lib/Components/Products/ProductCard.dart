import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Models/product.dart';
import 'package:fooddeliveryapp/Components/Products/ProductDetails.dart';
import 'package:fooddeliveryapp/UI/loading.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: product.name,
            child: Material(
                child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              pdName: product.name,
                              pdPrice: product.price,
                              pdDescription: product.description,
                              pdImage: product.imageUrl,
                            ))),
                    child: GridTile(
                      footer: Container(
                        height: 55.0,
                        color: Colors.white70,
                        child: ListTile(
                          title: Text(
                            product.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15.0),
                          ),
                        ),
                      ),
                      child: product.imageUrl != null
                          ? Image.network(product.imageUrl,
                              fit: BoxFit.fitWidth)
                          : Loading(),
                    )))));
  }
}
