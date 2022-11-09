import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String username;
  final String cpf;
  final String email;
  final String password;
  final String imgAvatar;
  UserModel({
    required this.username,
    required this.cpf,
    required this.email,
    required this.password,
    this.imgAvatar = 'default',
  });

  UserModel.empty()
      : username = '',
        cpf = '',
        email = '',
        password = '',
        imgAvatar = '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'cpf': cpf,
      'email': email,
      'password': password,
      'imgAvatar': imgAvatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        username: map['username'] ?? '',
        cpf: map['cpf'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        imgAvatar: map['imgAvatar'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
