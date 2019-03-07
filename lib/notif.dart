class Notif {
  final String item;
  final String joNo;

  Notif({this.item, this.joNo});

  factory Notif.fromJson(Map<String, dynamic> json) {
    return new Notif(
      item: json['item'] as String,
      joNo: json['joNo'] as String,
    );
  }
}