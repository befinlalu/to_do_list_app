part of 'get_tasks_bloc.dart';

abstract class GetTasksEvent {
  const GetTasksEvent();
}

class GetAllTasks extends GetTasksEvent {}

class GetCompletedTasks extends GetTasksEvent {}

class GetPendingTasks extends GetTasksEvent {}
