import 'package:equatable/equatable.dart';

class CarbonRecord extends Equatable {
  final String id;
  final String type;
  final double carbonValue;
  final String unit;
  final DateTime createdAt;
  final Map<String, dynamic>? metadata;

  const CarbonRecord({
    required this.id,
    required this.type,
    required this.carbonValue,
    required this.unit,
    required this.createdAt,
    this.metadata,
  });

  @override
  List<Object?> get props => [id, type, carbonValue, unit, createdAt, metadata];

  CarbonRecord copyWith({String? id, String? type, double? carbonValue, String? unit, DateTime? createdAt, Map<String, dynamic>? metadata}) {
    return CarbonRecord(
      id: id ?? this.id,
      type: type ?? this.type,
      carbonValue: carbonValue ?? this.carbonValue,
      unit: unit ?? this.unit,
      createdAt: createdAt ?? this.createdAt,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'carbonValue': carbonValue,
      'unit': unit,
      'createdAt': createdAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  factory CarbonRecord.fromJson(Map<String, dynamic> json) {
    return CarbonRecord(
      id: json['id'] as String,
      type: json['type'] as String,
      carbonValue: (json['carbonValue'] as num).toDouble(),
      unit: json['unit'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] != null ? Map<String, dynamic>.from(json['metadata']) : null,
    );
  }
}