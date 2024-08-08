part of 'complete_task_bloc.dart';

abstract class CompleteTaskEvent {
  const CompleteTaskEvent();
}

class CompleteTask extends CompleteTaskEvent {
  final int taskId;
  const CompleteTask({required this.taskId});
}
