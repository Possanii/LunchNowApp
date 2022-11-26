// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lunch_now/app/models/address_model.dart';

class SupplierNearbyMeModel {
  final String idr;
  final String name;
  final String cnpj;
  final AddressModel address;
  final String type;
  final String email;
  final String password;
  final String restaurantImgUrl;
  final double distancekm;
  SupplierNearbyMeModel({
    required this.idr,
    required this.name,
    required this.cnpj,
    required this.address,
    required this.type,
    required this.email,
    required this.password,
    required this.restaurantImgUrl,
    required this.distancekm,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idr': idr,
      'name': name,
      'cnpj': cnpj,
      'address': address.toMap(),
      'type': type,
      'email': email,
      'password': password,
      'restaurantImgUrl': restaurantImgUrl,
      'distancekm': distancekm,
    };
  }

  factory SupplierNearbyMeModel.fromMap(Map<String, dynamic> map) {
    return SupplierNearbyMeModel(
      idr: map['idr'] as String,
      name: map['name'] as String,
      cnpj: map['cnpj'] as String,
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      type: map['type'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      restaurantImgUrl: map['restaurantImgUrl'] as String,
      distancekm: map['distancekm'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SupplierNearbyMeModel.fromJson(String source) =>
      SupplierNearbyMeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
