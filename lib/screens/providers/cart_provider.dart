import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

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

  Future<void> addItem({
    required String id,
    required String name,
    required int price,
    required String image,
  }) async {
    if (_items.containsKey(id)) {
      _items[id]!.quantity++;
    } else {
      _items[id] = CartItem(id: id, name: name, price: price, image: image);
    }

    await saveCart();
    notifyListeners();
  }

  Future<void> decreaseItem(String id) async {
    if (!_items.containsKey(id)) return;

    if (_items[id]!.quantity > 1) {
      _items[id]!.quantity--;
    } else {
      _items.remove(id);
    }

    await saveCart();
    notifyListeners();
  }

  Future<void> removeItem(String id) async {
    _items.remove(id);
    await saveCart();
    notifyListeners();
  }

  Future<void> clearCart() async {
    _items.clear();
    await saveCart();
    notifyListeners();
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    final cartData = _items.map(
      (key, item) => MapEntry(key, {
        'id': item.id,
        'name': item.name,
        'price': item.price,
        'image': item.image,
        'quantity': item.quantity,
      }),
    );

    await prefs.setString('cart', jsonEncode(cartData));
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart');

    if (data != null) {
      final decoded = jsonDecode(data) as Map<String, dynamic>;

      _items = decoded.map(
        (key, value) => MapEntry(
          key,
          CartItem(
            id: value['id'],
            name: value['name'],
            price: value['price'],
            image: value['image'],
            quantity: value['quantity'],
          ),
        ),
      );

      notifyListeners();
    }
  }
}
