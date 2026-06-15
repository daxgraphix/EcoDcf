import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String name;

  @HiveField(3)
  late String? avatar;

  @HiveField(4)
  late String createdAt;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    email = json['email'] as String;
    name = json['name'] as String;
    avatar = json['avatar'] as String?;
    createdAt = json['createdAt'] as String;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'createdAt': createdAt,
    };
  }
}