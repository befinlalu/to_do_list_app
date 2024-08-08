part of 'delete_task_bloc.dart';

abstract class DeleteTaskEvent {
  const DeleteTaskEvent();
}

class DeleteTask extends DeleteTaskEvent {
  final int taskId;
  DeleteTask({required this.taskId});
}
