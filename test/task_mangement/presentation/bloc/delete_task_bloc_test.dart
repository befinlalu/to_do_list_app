import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/delete_task_bloc/delete_task_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockDeleteTaskUsecase mockDeleteTaskUsecase;
  late DeleteTaskBloc deleteTaskBloc;
  late int taskId;

  setUp(() {
    mockDeleteTaskUsecase = MockDeleteTaskUsecase();
    deleteTaskBloc = DeleteTaskBloc(mockDeleteTaskUsecase);
    taskId = 1;
  });

  group('DeleteTaskBloc', () {
    test('initial state is DeleteTaskInitial', () {
      expect(deleteTaskBloc.state, equals(DeleteTaskInitial()));
    });

    blocTest<DeleteTaskBloc, DeleteTaskState>(
      'emits [DeleteTaskLoadingState, DeleteTaskSuccessState] when deleteTask is added and deleteTask returns true',
      build: () {
        when(mockDeleteTaskUsecase.deleteTask(taskId))
            .thenAnswer((_) async => true);
        return deleteTaskBloc;
      },
      act: (bloc) => bloc.add(DeleteTask(taskId: 1)),
      expect: () => [
        DeleteTaskLoadingState(),
        DeleteTaskSuccessState(),
      ],
    );

    blocTest<DeleteTaskBloc, DeleteTaskState>(
      'emits [DeleteTaskLoadingState, DeleteTaskErrorState] when deleteTask is added and deleteTask returns false',
      build: () {
        when(mockDeleteTaskUsecase.deleteTask(taskId))
            .thenAnswer((_) async => false);
        return deleteTaskBloc;
      },
      act: (bloc) => bloc.add(DeleteTask(taskId: 1)),
      expect: () => [
        DeleteTaskLoadingState(),
        DeleteTaskErrorState(),
      ],
    );
  });
}
