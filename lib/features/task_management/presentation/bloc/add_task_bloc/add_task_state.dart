part of 'add_task_bloc.dart';

abstract class AddTaskState {
  const AddTaskState();
}

final class AddTaskInitial extends AddTaskState {}

class PostTaskLoadingState extends AddTaskState {}

class PostTaskErrorState extends AddTaskState {}

class PostTaskSuccessState extends AddTaskState {}
