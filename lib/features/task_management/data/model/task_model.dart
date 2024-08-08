import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/domain/entity/task_entity.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends TaskEntity {
  @HiveField(0)
  final String taskName;

  @HiveField(1)
  final String taskDescription;

  @HiveField(2)
  final int taskId;

  @HiveField(3)
  final bool isCompleted;

  const TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.taskId,
    required this.isCompleted,
  }) : super(
          taskName: taskName,
          taskDescription: taskDescription,
          taskId: taskId,
          isCompleted: isCompleted,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['taskName'],
      taskDescription: json['taskDescription'],
      taskId: json['taskId'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'taskDescription': taskDescription,
      'taskId': taskId,
      'isCompleted': isCompleted,
    };
  }

  TaskModel copyWith({
    String? taskName,
    String? taskDescription,
    int? taskId,
    bool? isCompleted,
  }) {
    return TaskModel(
      taskName: taskName ?? this.taskName,
      taskDescription: taskDescription ?? this.taskDescription,
      taskId: taskId ?? this.taskId,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
