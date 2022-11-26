import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealModel {
  final String name;
  final String description;
  final double price;
  final String img;
  MealModel({
    required this.name,
    required this.description,
    required this.price,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'img': img,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      img: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
