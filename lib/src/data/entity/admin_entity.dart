import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_entity.g.dart';

@JsonSerializable()
class AdminEntity extends Equatable {
  final int id;
  final String name;

  const AdminEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  @override
  String toString() {
    return 'AdminEntity{id: $id, name: $name}';
  }

  AdminEntity copyWith({
    int? id,
    String? name,
  }) {
    return AdminEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory AdminEntity.fromJson(Map<String, dynamic> json) =>
      _$AdminEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AdminEntityToJson(this);
}
