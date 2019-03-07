class History {
  final String item;
  final String joNo;
  final String date;

  History({this.item, this.joNo, this.date});

  factory History.fromJson(Map<String, dynamic> json) {
    return new History(
      item: json['item'] as String,
      joNo: json['joNo'] as String,
      date: json['date'] as String,
    );
  }
}