// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lunch_now/app/models/address_model.dart';

class SupplierNearbyMeModel {
  final String name;
  final String cnpj;
  final AddressModel address;
  final String type;
  final String email;
  final String password;
  final String restaurantImgUrl;
  final String idr;
  SupplierNearbyMeModel({
    required this.name,
    required this.cnpj,
    required this.address,
    required this.type,
    required this.email,
    required this.password,
    required this.restaurantImgUrl,
    required this.idr,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cnpj': cnpj,
      'address': address.toMap(),
      'type': type,
      'email': email,
      'password': password,
      'restaurantImgUrl': restaurantImgUrl,
      'idr': idr,
    };
  }

  factory SupplierNearbyMeModel.fromMap(Map<String, dynamic> map) {
    return SupplierNearbyMeModel(
      name: map['name'] as String,
      cnpj: map['cnpj'] as String,
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      type: map['type'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      restaurantImgUrl: map['restaurantImgUrl'] as String,
      idr: map['idr'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierNearbyMeModel.fromJson(String source) =>
      SupplierNearbyMeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
