import 'package:fooddeliveryapp/Models/cart_item.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  List<CartItem> cart = [];
  num totalValue = 0;

  int get total => cart.length;

  void addItem(item, qty) {
    int index = cart.indexWhere((i) => i.product.name == item.product.name);
    if (index != -1) {
      cart[index].qty = qty;
    } else {
      cart.add(item);
      calculateTotal();
      print(totalValue);
      notifyListeners();
    }
  }

  void removeItem(CartItem item) {
    cart.removeWhere((i) => i.product.name == item.product.name);
    calculateTotal();
    notifyListeners();
  }

  void calculateTotal() {
    totalValue = 0;
    for (int i = 0; i < cart.length; i++) {
      totalValue += num.tryParse(cart[i].product.price) * cart[i].qty;
    }
  }
}
