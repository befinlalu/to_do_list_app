part of 'get_tasks_bloc.dart';

abstract class GetTasksState {
  const GetTasksState();
}

final class GetTasksInitial extends GetTasksState {}

class GetTasksSuccessState extends GetTasksState {
  final List<TaskEntity> tasks;

  GetTasksSuccessState({required this.tasks});
}

class GetTasksErrorState extends GetTasksState {}

class GetTasksLoadingState extends GetTasksState {}
