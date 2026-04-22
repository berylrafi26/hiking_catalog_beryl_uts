import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  int get totalPrice {
    return _items.values.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void addItem({
    required String id,
    required String name,
    required int price,
    required String image,
  }) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity++;
    } else {
      _items[id] = CartItem(id: id, name: name, price: price, image: image);
    }
    notifyListeners();
  }
}
