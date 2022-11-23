import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SupplierNearbyMeModel {
  final String id;
  final String name;
  final String img;
  final double distance;
  final String category;
  SupplierNearbyMeModel({
    required this.id,
    required this.name,
    required this.img,
    required this.distance,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'img': img,
      'distance': distance,
      'category': category,
    };
  }

  factory SupplierNearbyMeModel.fromMap(Map<String, dynamic> map) {
    return SupplierNearbyMeModel(
      id: map['id'] as String,
      name: map['name'] as String,
      img: map['img'] as String,
      distance: map['distance'] as double,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierNearbyMeModel.fromJson(String source) =>
      SupplierNearbyMeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
