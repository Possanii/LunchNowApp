import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String email;
  final String password;
  final String imgAvatar;
  UserModel({
    required this.email,
    required this.password,
    required this.imgAvatar,
  });

  UserModel.empty()
      : email = '',
        password = '',
        imgAvatar = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'imgAvatar': imgAvatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        imgAvatar: map['imgAvatar'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
