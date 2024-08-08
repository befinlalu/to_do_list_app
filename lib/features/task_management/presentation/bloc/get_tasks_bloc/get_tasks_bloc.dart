import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/get_task_serivce.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/data/repository/get_task_repository_implementation.dart';
import 'package:to_do_list_app/features/task_management/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/get_task_usecase.dart';

part 'get_tasks_event.dart';
part 'get_tasks_state.dart';

class GetTasksBloc extends Bloc<GetTasksEvent, GetTasksState> {
  GetTasksBloc() : super(GetTasksInitial()) {
    on<GetTasksEvent>((event, emit) {});
    on<GetAllTasks>(getAllTasks);
    on<GetPendingTasks>(getPendingTasks);
    on<GetCompletedTasks>(getCompletedTasks);
  }

  FutureOr<void> getAllTasks(
      GetAllTasks event, Emitter<GetTasksState> emit) async {
    emit(GetTasksLoadingState());
    final tasksBox = Hive.box<TaskModel>('tasksBox');
    final useCase = GetTaskUsecase(
        GetTaskRepositoryImplementation(GetTaskService(tasksBox)));
    final tasks = await useCase();
    emit(GetTasksSuccessState(tasks: tasks));
  }

  FutureOr<void> getPendingTasks(
      GetPendingTasks event, Emitter<GetTasksState> emit) async {}

  FutureOr<void> getCompletedTasks(
      GetCompletedTasks event, Emitter<GetTasksState> emit) async {}
}
