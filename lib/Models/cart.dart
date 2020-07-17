import 'package:fooddeliveryapp/Models/cart_item.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  List<CartItem> cart = [];

  int get total => cart.length;
  int get totalCartValue {
    int total = 0;
    for (int i = 0; i < cart.length; i++) total += cart[i].price * cart[i].qty;
    return total;
  }

  void addItem(item, qty) {
    int index = cart.indexWhere((i) => i.name == item.name);
    if (index != -1) {
      cart[index].qty = qty;
    } else {
      cart.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    cart.removeWhere((i) => i.name == item.name);
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((item) => cart.remove(item));
    notifyListeners();
  }
}
