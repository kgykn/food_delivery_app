import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final name;
  final price;
  final description;
  final imageUrl;
  final category;
  int quantity;

  ProductDetails(
      {this.name,
      this.price,
      this.description,
      this.imageUrl,
      this.category,
      this.quantity});

  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isQuantityInvalid = false;

  @override
  Widget build(BuildContext context) {
    (widget.quantity == 0)
        ? setState(() => isQuantityInvalid = true)
        : setState(() => isQuantityInvalid = false);
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
              child: Image.network(widget.imageUrl),
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
                child: Text("Add to cart"),
              )),
              Container(
                  height: 30.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      isQuantityInvalid
                          ? IconButton(
                              icon: Icon(Icons.remove,
                                  size: 20.0, color: Colors.grey),
                              onPressed: () {})
                          : IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.deepOrangeAccent,
                                size: 20.0,
                              ),
                              onPressed: () {
                                setState(() => widget.quantity--);
                              }),
                      Text(widget.quantity.toString(),
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      IconButton(
                          icon: Icon(Icons.add,
                              color: Colors.deepOrangeAccent, size: 20.0),
                          onPressed: () => setState(() => widget.quantity++)),
                    ],
                  )),
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
