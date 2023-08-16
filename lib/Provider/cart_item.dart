import 'package:flutter/material.dart';

import '../Model/card_item.dart';

class CartItemProvider extends ChangeNotifier {
  final List<CardItem> _items = [];

  List<CardItem> get items => _items;

  void addItem(CardItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CardItem item) {
    int index = _items.indexWhere((element) => element.title == item.title);
    _items.removeAt(index);
    notifyListeners();
  }

  void updateItem(CardItem item, int newFaults) {
    int index = _items.indexWhere((element) => element.title == item.title);
    _items[index] = CardItem(
      title: item.title,
      hours: item.hours,
      faults: newFaults,
    );
    notifyListeners();
  }

  // Implemente outros métodos conforme necessário, como atualizar e excluir tarefas.
}
