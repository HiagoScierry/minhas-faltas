import 'dart:convert';

class CardItem {
  final String title;
  final int hours;
  final int faults = 0;

  CardItem({required this.title, required this.hours});

  addFaults() {
    faults + 1;
  }

  removeFaults() {
    if (faults > 0) {
      faults - 1;
    }
  }

  static fromJson(String data) {
    //string to json
    Map<String, dynamic> jsonMap = json.decode(data);

    return CardItem(
      title: jsonMap[''],
      hours: jsonMap['hours'],
    );
  }
}
