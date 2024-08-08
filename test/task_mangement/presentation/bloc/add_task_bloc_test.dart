import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/add_task_bloc/add_task_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockPostTaskUsecase mockPostTaskUsecase;
  late AddTaskBloc addTaskBloc;
  late TaskModel task;

  setUp(() {
    mockPostTaskUsecase = MockPostTaskUsecase();
    addTaskBloc = AddTaskBloc(mockPostTaskUsecase);
    task = const TaskModel(
      taskId: 1,
      taskName: 'Test Task',
      taskDescription: 'Test Description',
      isCompleted: false,
    );
  });

  group('AddTaskBloc', () {
    test('initial state is AddTaskInitial', () {
      expect(addTaskBloc.state, equals(AddTaskInitial()));
    });
    blocTest<AddTaskBloc, AddTaskState>(
      'emits [PostTaskLoadingState, PostTaskSuccessState] when postTaskEvent is added and postTask returns true',
      build: () {
        when(mockPostTaskUsecase.postTask(task)).thenAnswer((_) async => true);
        return addTaskBloc;
      },
      act: (bloc) => bloc.add(PostTaskEvent(
        taskName: 'Test Task',
        taskDescription: 'Test Description',
        taskId: 1,
      )),
      expect: () => [
        PostTaskLoadingState(),
        PostTaskSuccessState(),
      ],
    );

    blocTest<AddTaskBloc, AddTaskState>(
      'emits [PostTaskLoadingState, PostTaskErrorState] when postTaskEvent is added and postTask returns false',
      build: () {
        when(mockPostTaskUsecase.postTask(task)).thenAnswer((_) async => false);
        return addTaskBloc;
      },
      act: (bloc) => bloc.add(PostTaskEvent(
        taskName: 'Test Task',
        taskDescription: 'Test Description',
        taskId: 1,
      )),
      expect: () => [
        PostTaskLoadingState(),
        PostTaskErrorState(),
      ],
    );
  });
}
