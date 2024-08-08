import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String taskName;
  final String taskDescription;
  final int taskId;
  final bool isCompleted;

  const TaskEntity({
    required this.taskName,
    required this.taskDescription,
    required this.taskId,
    required this.isCompleted,
  });
  @override
  List<Object?> get props => [
        taskName,
        taskDescription,
        taskId,
        isCompleted,
      ];
}
