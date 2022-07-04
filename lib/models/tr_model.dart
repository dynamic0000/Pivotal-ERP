import 'dart:convert';

class TryModel {
  final String name;
  final String address;
  final int phno;
  TryModel({
    required this.name,
    required this.address,
    required this.phno,
  });




  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'address': address});
    result.addAll({'phno': phno});
  
    return result;
  }

  factory TryModel.fromMap(Map<String, dynamic> map) {
    return TryModel(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phno: map['phno']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TryModel.fromJson(String source) => TryModel.fromMap(json.decode(source));
}
