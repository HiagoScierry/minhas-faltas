import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/card_item.dart';

class CardItemsProvider extends ChangeNotifier {
  List<CardItem> _cardItems = [];

  List<CardItem> get cardItems => _cardItems;

  CardItemsProvider() {
    _loadCardItems();
  }

  void _loadCardItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cardItemsJson = prefs.getStringList('cardItems');

    notifyListeners();
  }

  void saveCardItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
