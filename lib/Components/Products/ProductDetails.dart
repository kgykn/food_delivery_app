import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final name;
  final price;
  final description;
  final image;
  final category;

  ProductDetails(
      {this.name, this.price, this.description, this.image, this.category});

  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            'Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: Image.network(widget.image),
            ),
            Container(
                child: GridTile(
              child: Container(
                  color: Colors.white,
                  child: ListTile(
                      leading: Text(widget.name),
                      title: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "${widget.price}VND",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent,
                                fontSize: 20),
                          )))),
            )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text('Category',
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(width: 50),
                    Text(widget.category,
                        style: TextStyle(fontWeight: FontWeight.w800))
                  ],
                )),
            Row(children: <Widget>[
              SizedBox(width: 10),
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: Text("Buy now"),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.deepOrangeAccent,
                  ),
                  onPressed: () {},
                ),
              )
            ]),
            Divider(),
            ListTile(
              title: Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              subtitle: Text(
                "${widget.description}",
                style: TextStyle(fontSize: 14.0),
              ),
            )
          ],
        ));
  }
}
