class Joborder {
  final String joNo;
  final String imageSrc;
  final String model;
  final String make;
  final String category;
  final String serial;
  final String csa;

  Joborder({
    this.joNo, 
    this.imageSrc,
    this.model,
    this.make,
    this.category,
    this.serial,
    this.csa
  });

  factory Joborder.fromJson(Map<String, dynamic> json) {
    return new Joborder(
      joNo: json['joNo'] as String,
      imageSrc: json['imageSrc'] as String,
      model: json['model'] as String,
      make: json['make'] as String,
      category: json['category'] as String,
      serial: json['serial'] as String,
      csa: json['csa'] as String
    );
  }
}