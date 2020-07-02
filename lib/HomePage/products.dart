import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/HomePage/product_details.dart';

class Product extends StatefulWidget {
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var product_list = [
    {
      "name": "Hot Espresso",
      "imgLocation": "images/products/hot-espresso.png",
      "price": "40000",
      "description": "Hot expresso"
    },
    {
      "name": "Hot Chocolate",
      "imgLocation": "images/products/hot-choco.jpg",
      "price": "59000",
      "description": "Hot chocolate"
    },
    {
      "name": "Ice-blended Matcha",
      "imgLocation": "images/products/matcha-ice_blended.jpg",
      "price": "59000",
      "description": "Ice-blended Matcha"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ProductGrid(
            name: product_list[index]["name"],
            imgLocation: product_list[index]["imgLocation"],
            price: product_list[index]["price"],
            description: product_list[index]["description"],
          );
        });
  }
}

class ProductGrid extends StatelessWidget {
  final String name;
  final String imgLocation;
  final String price;
  final String description;

  ProductGrid({this.name, this.imgLocation, this.price, this.description});

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
                              pd_picture_location: imgLocation,
                            ))),
                    child: GridTile(
                      footer: Container(
                        height: 55.0,
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
                      child: Image.asset(imgLocation, fit: BoxFit.cover),
                    )))));
  }
}
