import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/core/utils/task_id_service.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/post_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/data/repository/post_task_repository_implementation.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/post_task_usecase.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskInitial()) {
    on<AddTaskEvent>((event, emit) {});
    on<PostTaskEvent>(postTaskEvent);
  }

  FutureOr<void> postTaskEvent(
      PostTaskEvent event, Emitter<AddTaskState> emit) async {
    emit(PostTaskLoadingState());
    int taskId = await TaskIdService.getNextTaskId();
    final task = TaskModel(
      taskName: event.taskName,
      taskDescription: event.taskDescription,
      taskId: taskId,
      isCompleted: false,
    );
    final tasksBox = Hive.box<TaskModel>('tasksBox');
    final useCase = PostTaskUsecase(PostTaskRepositoryImplementation(
      PostTaskService(tasksBox),
      task,
    ));
    final response = await useCase();
    if (response) {
      emit(PostTaskSuccessState());
    } else {
      emit(PostTaskErrorState());
    }
  }
}
