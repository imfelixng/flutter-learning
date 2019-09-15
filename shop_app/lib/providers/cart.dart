import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    this.id,
    this.title,
    this.quantity,
    this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {
      ..._items
    };
  }

  int get itemCount => _items.length;

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (cartItem) => CartItem(id: cartItem.id, title: cartItem.title, quantity: cartItem.quantity + 1, price: cartItem.price));
    } else {
      _items.putIfAbsent(productId,() => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(ValueKey(productId));
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

}
