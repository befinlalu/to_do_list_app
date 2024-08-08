import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/complete_task_bloc/complete_task_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockCompleteTaskUsecase mockCompleteTaskUsecase;
  late CompleteTaskBloc completeTaskBloc;
  late int taskId;

  setUp(() {
    mockCompleteTaskUsecase = MockCompleteTaskUsecase();
    completeTaskBloc = CompleteTaskBloc(mockCompleteTaskUsecase);
    taskId = 1;
  });

  group('CompleteTaskBloc', () {
    test('initial state is CompleteTaskInitial', () {
      expect(completeTaskBloc.state, equals(CompleteTaskInitial()));
    });

    blocTest<CompleteTaskBloc, CompleteTaskState>(
      'emits [CompleteTaskLoadingState, CompleteTaskSuccessState] when completeTask is added and completeTask returns true',
      build: () {
        when(mockCompleteTaskUsecase.completeTask(taskId))
            .thenAnswer((_) async => true);
        return completeTaskBloc;
      },
      act: (bloc) => bloc.add(const CompleteTask(taskId: 1)),
      expect: () => [
        CompleteTaskLoadingState(),
        CompleteTaskSuccessState(),
      ],
    );

    blocTest<CompleteTaskBloc, CompleteTaskState>(
      'emits [CompleteTaskLoadingState, CompleteTaskErrorState] when completeTask is added and completeTask returns false',
      build: () {
        when(mockCompleteTaskUsecase.completeTask(taskId))
            .thenAnswer((_) async => false);
        return completeTaskBloc;
      },
      act: (bloc) => bloc.add(const CompleteTask(taskId: 1)),
      expect: () => [
        CompleteTaskLoadingState(),
        CompleteTaskErrorState(),
      ],
    );
  });
}
