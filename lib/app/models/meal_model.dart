import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealModel {
  final String idm;
  final String name;
  final double price;
  final String idr;
  final String mealImgUrl;
  final String desc;
  MealModel({
    required this.idm,
    required this.name,
    required this.price,
    required this.idr,
    required this.mealImgUrl,
    required this.desc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idm': idm,
      'name': name,
      'price': price,
      'idr': idr,
      'mealImgUrl': mealImgUrl,
      'desc': desc,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      idm: map['idm'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      idr: map['idr'] as String,
      mealImgUrl: map['mealImgUrl'] as String,
      desc: map['desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
