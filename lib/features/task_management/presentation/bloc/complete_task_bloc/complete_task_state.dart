part of 'complete_task_bloc.dart';

abstract class CompleteTaskState {
  const CompleteTaskState();
}

final class CompleteTaskInitial extends CompleteTaskState {}

class CompleteTaskSuccessState extends CompleteTaskState {}

class CompleteTaskLoadingState extends CompleteTaskState {}

class CompleteTaskErrorState extends CompleteTaskState {}
