import 'package:fooddeliveryapp/Models/product.dart';

class CartItem {
  final String name;
  final int price;
  final String imageUrl;
  int qty;

  CartItem({this.name, this.price, this.imageUrl, this.qty});
}
