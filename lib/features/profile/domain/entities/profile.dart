import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String? bio;
  final DateTime createdAt;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.bio,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, email, avatar, bio, createdAt];

  Profile copyWith({String? id, String? name, String? email, String? avatar, String? bio, DateTime? createdAt}) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}