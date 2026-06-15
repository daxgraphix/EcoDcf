import 'package:equatable/equatable.dart';

class Integration extends Equatable {
  final String id;
  final String name;
  final String type;
  final bool isConnected;
  final String? accountId;

  const Integration({
    required this.id,
    required this.name,
    required this.type,
    this.isConnected = false,
    this.accountId,
  });

  @override
  List<Object?> get props => [id, name, type, isConnected, accountId];
}