import 'dart:convert';

class CardItem {
  final String title;
  final int hours;
  final int faults;

  CardItem({required this.title, required this.hours, required this.faults});

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
      title: jsonMap['title'],
      hours: jsonMap['hours'],
      faults: jsonMap['faults'],
    );
  }
}
