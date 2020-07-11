import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fooddeliveryapp/Models/product.dart';
import 'package:fooddeliveryapp/Components/Products/ProductCard.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context) ?? [];
    if (products.length > 0) {
      return GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("No products available"),
      );
    }
  }
}
