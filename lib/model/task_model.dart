import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  @JsonKey(name: "taskName")
  final String title;
  @HiveField(2)
  final DateTime createdDate;
  @HiveField(3)
  final DateTime? completedDate;
  @HiveField(4)
  @JsonKey(name: "isFinished", defaultValue: false)
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.createdDate,
    this.completedDate,
    required this.isCompleted,
  });

  factory TaskModel.fromJson( Map<String, dynamic> json) {
    return _$TaskModelFromJson( json);
  }

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  TaskModel copyWith({
    String? id,
    String? title,
    DateTime? createdDate,
    DateTime? completedDate,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      createdDate: createdDate ?? this.createdDate,
      completedDate: completedDate ?? this.completedDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
