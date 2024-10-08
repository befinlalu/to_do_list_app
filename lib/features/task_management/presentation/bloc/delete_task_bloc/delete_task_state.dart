part of 'delete_task_bloc.dart';

abstract class DeleteTaskState extends Equatable {
  const DeleteTaskState();
  @override
  List<Object?> get props => [];
}

final class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskSuccessState extends DeleteTaskState {}

class DeleteTaskLoadingState extends DeleteTaskState {}

class DeleteTaskErrorState extends DeleteTaskState {}
