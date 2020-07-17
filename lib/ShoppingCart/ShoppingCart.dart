import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Models/cart.dart';
import 'package:scoped_model/scoped_model.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            "Cart",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                    .cart
                    .length ==
                0
            ? Center(
                child: Text('No items in cart yet. Go buy some!'),
              )
            : Container(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                          .total,
                  itemBuilder: (context, index) {
                    return ScopedModelDescendant<CartModel>(
                        builder: (context, child, model) {
                      return ListTile(
                        leading: Container(
                            width: 70,
                            child: Image.network(
                              model.cart[index].imageUrl,
                              fit: BoxFit.fitWidth,
                            )),
                        title: Text(model.cart[index].name,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        subtitle: Text(model.cart[index].qty.toString() +
                            " x " +
                            model.cart[index].price.toString() +
                            " = " +
                            (model.cart[index].qty * model.cart[index].price)
                                .toString()),
                      );
                    });
                  },
                )),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              Container(
                width: 220,
                child: Text(
                  "Total: " +
                      ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                          .totalCartValue
                          .toString() +
                      "VND",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                  child: MaterialButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.deepOrangeAccent,
                child: Text('Buy now', style: TextStyle(color: Colors.white)),
              ))
            ])));
  }
}
