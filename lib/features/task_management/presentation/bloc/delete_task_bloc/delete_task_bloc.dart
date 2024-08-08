import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/delete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/data/repository/delete_task_repository_implementation.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/delete_task_usecase.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';

class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  DeleteTaskBloc() : super(DeleteTaskInitial()) {
    on<DeleteTaskEvent>((event, emit) {});
    on<DeleteTask>(deleteTask);
  }

  FutureOr<void> deleteTask(
      DeleteTask event, Emitter<DeleteTaskState> emit) async {
    emit(DeleteTaskLoadingState());
    final tasksBox = Hive.box<TaskModel>('tasksBox');
    final useCase = DeleteTaskUsecase(
      DeleteTaskRepositoryImplementation(
          DeleteTaskService(tasksBox), event.taskId),
    );
    final response = await useCase();
    if (response) {
      emit(DeleteTaskSuccessState());
    } else {
      emit(DeleteTaskErrorState());
    }
  }
}
