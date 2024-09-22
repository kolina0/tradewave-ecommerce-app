import 'package:estore/core/api/end_points.dart';

class UserModel {
  final num id;
  final String email;
  final String password;
  final String name;
  final String avatar;
  final String role;
  final String creationAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.avatar,
    required this.role,
    required this.creationAt,
    required this.updatedAt,
  });
  factory UserModel.fromJson(jsonData) {
    return UserModel(
      id: jsonData[ApiJsonKey.id],
      email: jsonData[ApiJsonKey.email],
      password: jsonData[ApiJsonKey.password],
      name: jsonData[ApiJsonKey.name],
      avatar: jsonData[ApiJsonKey.avatar],
      role: jsonData[ApiJsonKey.role],
      creationAt: jsonData[ApiJsonKey.creationAt],
      updatedAt: jsonData[ApiJsonKey.updatedAt],
    );
  }
}
