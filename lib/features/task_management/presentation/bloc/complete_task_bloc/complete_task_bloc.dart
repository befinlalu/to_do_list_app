import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/complete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/data/repository/complete_task_repository_implementation.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/complete_task_usecase.dart';

part 'complete_task_event.dart';
part 'complete_task_state.dart';

class CompleteTaskBloc extends Bloc<CompleteTaskEvent, CompleteTaskState> {
  CompleteTaskBloc() : super(CompleteTaskInitial()) {
    on<CompleteTaskEvent>((event, emit) {});
    on<CompleteTask>(completeTask);
  }

  FutureOr<void> completeTask(
      CompleteTask event, Emitter<CompleteTaskState> emit) async {
    emit(CompleteTaskLoadingState());
    final tasksBox = Hive.box<TaskModel>('tasksBox');
    final useCase = CompleteTaskUsecase(
      CompleteTaskRepositoryImplementation(
          CompleteTaskService(tasksBox), event.taskId),
    );
    final response = await useCase();
    if (response) {
      emit(CompleteTaskSuccessState());
    } else {
      emit(CompleteTaskErrorState());
    }
  }
}
