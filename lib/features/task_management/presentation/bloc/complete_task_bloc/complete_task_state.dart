part of 'complete_task_bloc.dart';

abstract class CompleteTaskState extends Equatable {
  const CompleteTaskState();
  @override
  List<Object?> get props => [];
}

final class CompleteTaskInitial extends CompleteTaskState {}

class CompleteTaskSuccessState extends CompleteTaskState {}

class CompleteTaskLoadingState extends CompleteTaskState {}

class CompleteTaskErrorState extends CompleteTaskState {}
