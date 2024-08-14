import 'dart:convert';

///TODO: add description
///usar freezed
class UsersDto {
  UsersDto({
    this.username,
    this.email,
    this.password,
    this.token,
    this.newPassword,
  });

  factory UsersDto.fromRawJson(String str) =>
      UsersDto.fromJson(json.decode(str) as Map<String, dynamic>);

  factory UsersDto.fromJson(Map<String, dynamic> json) => UsersDto(
        username: json['username'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        token: json['token'] as String?,
        newPassword: json['newPassword'] as String?,
      );

  final String? username;
  final String? email;
  final String? password;
  final String? token;
  final String? newPassword;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
        'token': token,
        'newPassword': newPassword,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.passwordHash,
    this.passwordSalt,
    this.isEmailConfirmed,
    this.passwordResetToken,
    this.passwordResetTokenExpiry,
    this.urlImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        passwordHash: json['passwordHash'] as String?,
        passwordSalt: json['passwordSalt'] as String?,
        isEmailConfirmed: json['isEmailConfirmed'] as bool,
        passwordResetToken: json['passwordResetToken'] as String?,
        passwordResetTokenExpiry: json['passwordResetTokenExpiry'] == null
            ? null
            : DateTime.parse(json['passwordResetTokenExpiry'] as String),
        urlImage: json['urlImage'] as String?,
      );

  factory User.fromRawJson(String str) =>
      User.fromJson(json.decode(str) as Map<String, dynamic>);
  final String? id;
  final String? username;
  final String? email;
  final String? passwordHash;
  final String? passwordSalt;
  final bool? isEmailConfirmed;
  final String? passwordResetToken;
  final DateTime? passwordResetTokenExpiry;
  final String? urlImage;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'passwordHash': passwordHash,
        'passwordSalt': passwordSalt,
        'isEmailConfirmed': isEmailConfirmed,
        'passwordResetToken': passwordResetToken,
        'passwordResetTokenExpiry': passwordResetTokenExpiry?.toIso8601String(),
        'urlImage': urlImage,
      };
}
