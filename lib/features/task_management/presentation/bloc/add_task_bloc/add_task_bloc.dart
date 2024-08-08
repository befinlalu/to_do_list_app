import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/post_task_usecase.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final PostTaskUsecase postTaskUsecase;

  AddTaskBloc(this.postTaskUsecase) : super(AddTaskInitial()) {
    on<AddTaskEvent>((event, emit) {});
    on<PostTaskEvent>(postTaskEvent);
  }

  FutureOr<void> postTaskEvent(
      PostTaskEvent event, Emitter<AddTaskState> emit) async {
    emit(PostTaskLoadingState());
    final task = TaskModel(
      taskName: event.taskName,
      taskDescription: event.taskDescription,
      taskId: event.taskId,
      isCompleted: false,
    );
    final response = await postTaskUsecase.postTask(task);
    if (response) {
      emit(PostTaskSuccessState());
    } else {
      emit(PostTaskErrorState());
    }
  }
}
