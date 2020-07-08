import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final pdName;
  final pdPrice;
  final pdDescription;
  final pdImage;

  ProductDetails({this.pdName, this.pdPrice, this.pdDescription, this.pdImage});

  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          height: 300,
          child: Image.network(widget.pdImage),
        ),
        Container(
            child: GridTile(
          child: Container(
              color: Colors.white,
              child: ListTile(
                  leading: Text(widget.pdName),
                  title: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "${widget.pdPrice}VND",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent,
                            fontSize: 20),
                      )))),
        )),
        Row(
          children: <Widget>[
            Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Size"),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("Close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Size")),
                        Expanded(child: Icon(Icons.arrow_drop_down)),
                      ],
                    ))),
            Expanded(
                child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Hot/Cold"),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: Text("Close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Hot/Cold")),
                        Expanded(child: Icon(Icons.arrow_drop_down)),
                      ],
                    ))),
          ],
        ),
        Row(children: <Widget>[
          Expanded(
              child: MaterialButton(
            onPressed: () {},
            color: Colors.deepOrangeAccent,
            textColor: Colors.white,
            child: Text("Buy now"),
          )),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.deepOrangeAccent,
            ),
            onPressed: () {},
          )
        ]),
        Divider(),
        ListTile(
          title: Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          subtitle: Text(
            "${widget.pdDescription}",
            style: TextStyle(fontSize: 14.0),
          ),
        )
      ],
    ));
  }
}
