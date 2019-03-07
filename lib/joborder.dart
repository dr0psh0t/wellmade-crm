class Joborder {
  final String joNo;
  final String imageSrc;

  Joborder({this.joNo, this.imageSrc});

  factory Joborder.fromJson(Map<String, dynamic> json) {
    return new Joborder(
      joNo: json['joNo'] as String,
      imageSrc: json['imageSrc'] as String,
    );
  }
}