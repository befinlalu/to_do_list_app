part of 'add_task_bloc.dart';

abstract class AddTaskEvent {
  const AddTaskEvent();
}

class PostTaskEvent extends AddTaskEvent {
  final String taskName;
  final String taskDescription;
  final int taskId;

  PostTaskEvent({
    required this.taskName,
    required this.taskDescription,
    required this.taskId,
  });
}
