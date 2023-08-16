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
}
