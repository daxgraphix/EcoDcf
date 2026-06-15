import 'package:equatable/equatable.dart';

class Report extends Equatable {
  final String id;
  final String title;
  final String type;
  final DateTime createdAt;
  final Map<String, dynamic> data;

  const Report({
    required this.id,
    required this.title,
    required this.type,
    required this.createdAt,
    required this.data,
  });

  @override
  List<Object?> get props => [id, title, type, createdAt, data];
}