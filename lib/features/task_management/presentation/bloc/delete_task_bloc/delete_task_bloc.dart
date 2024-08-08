import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/delete_task_usecase.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  final DeleteTaskUsecase deleteTaskUsecase;
  DeleteTaskBloc(this.deleteTaskUsecase) : super(DeleteTaskInitial()) {
    on<DeleteTaskEvent>((event, emit) {});
    on<DeleteTask>(deleteTask);
  }

  FutureOr<void> deleteTask(
      DeleteTask event, Emitter<DeleteTaskState> emit) async {
    emit(DeleteTaskLoadingState());

    final response = await deleteTaskUsecase.deleteTask(event.taskId);
    if (response) {
      emit(DeleteTaskSuccessState());
    } else {
      emit(DeleteTaskErrorState());
    }
  }
}
