import 'package:coffe_app/Product.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  double get totalPrice {
    return _items.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }

  void clearCart() {}
}
