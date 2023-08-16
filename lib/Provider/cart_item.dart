import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/card_item.dart';

class CartItemProvider extends ChangeNotifier {
  final List<CardItem> _items = [];
  SharedPreferences? _prefs;

  List<CardItem> get items => _items;

  CartItemProvider() {
    _loadData();
  }

  void _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    List<String>? data = _prefs?.getStringList('items');
    if (data != null) {
      _items.clear();
      data.forEach((element) {
        List<String> item = element.split(',');
        _items.add(CardItem(
          title: item[0],
          hours: int.parse(item[1]),
          faults: int.parse(item[2]),
        ));
      });
      notifyListeners();
    }
  }

  void _saveData() async {
    List<String> data = [];
    _items.forEach((element) {
      data.add('${element.title},${element.hours},${element.faults}');
    });
    await _prefs?.setStringList('items', data);
  }

  void addItem(CardItem item) {
    _items.add(item);
    _saveData();
    notifyListeners();
  }

  void removeItem(CardItem item) {
    int index = _items.indexWhere((element) => element.title == item.title);
    _items.removeAt(index);
    _saveData();
    notifyListeners();
  }

  void updateItem(CardItem item, int newFaults) {
    int index = _items.indexWhere((element) => element.title == item.title);
    _items[index] = CardItem(
      title: item.title,
      hours: item.hours,
      faults: newFaults,
    );
    _saveData();
    notifyListeners();
  }

  // Implemente outros métodos conforme necessário, como atualizar e excluir tarefas.
}
