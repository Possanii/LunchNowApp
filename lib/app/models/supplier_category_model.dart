import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SupplierCategoryModel {
  final String name;
  SupplierCategoryModel({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory SupplierCategoryModel.fromMap(Map<String, dynamic> map) {
    return SupplierCategoryModel(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierCategoryModel.fromJson(String source) =>
      SupplierCategoryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
