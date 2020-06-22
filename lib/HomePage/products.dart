import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/HomePage/product_details.dart';
class Product extends StatefulWidget{
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var product_list = [
    {
      "name": "Hot Espresso",
      "picture_location": "images/products/hot-espresso.png",
      "price": "40000",
      "description": "Hot expresso"
    },
    {
      "name": "Hot Chocolate",
      "picture_location": "images/products/hot-choco.jpg",
      "price": "59000",
      "description": "Hot chocolate"
    },
    {
      "name": "Ice-blended Matcha",
      "picture_location": "images/products/matcha-ice_blended.jpg",
      "price": "59000",
      "description": "Ice-blended Matcha"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
      },
    );
  }
}

class ProductGrid extends StatelessWidget {
  final prod_name;
  final prod_picture_location;
  final prod_price;
  final prod_description;

  ProductGrid({
    this.prod_name,
    this.prod_picture_location,
    this.prod_price,
    this.prod_description
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
            tag: prod_name,
            child: Material(
                child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails())),
                    child: GridTile(
                      footer: Container(
                        height: 55.0,
                        color: Colors.white70,
                        child: ListTile(
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
  }
}