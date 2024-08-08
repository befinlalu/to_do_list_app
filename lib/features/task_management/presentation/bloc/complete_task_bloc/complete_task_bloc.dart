import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/complete_task_usecase.dart';

part 'complete_task_event.dart';
part 'complete_task_state.dart';

class CompleteTaskBloc extends Bloc<CompleteTaskEvent, CompleteTaskState> {
  final CompleteTaskUsecase completeTaskUsecase;
  CompleteTaskBloc(this.completeTaskUsecase) : super(CompleteTaskInitial()) {
    on<CompleteTaskEvent>((event, emit) {});
    on<CompleteTask>(completeTask);
  }

  FutureOr<void> completeTask(
      CompleteTask event, Emitter<CompleteTaskState> emit) async {
    emit(CompleteTaskLoadingState());

    final response = await completeTaskUsecase.completeTask(event.taskId);
    if (response) {
      emit(CompleteTaskSuccessState());
    } else {
      emit(CompleteTaskErrorState());
    }
  }
}
