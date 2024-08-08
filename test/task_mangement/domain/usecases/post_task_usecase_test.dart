import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/post_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart'; // Ensure you import mockito for mocking

void main() {
  late PostTaskUsecase postTaskUseCase;
  late MockPostTaskRepository mockPostTaskRepository;
  late TaskModel task;

  setUp(() {
    mockPostTaskRepository = MockPostTaskRepository();
    postTaskUseCase = PostTaskUsecase(mockPostTaskRepository);
    task = const TaskModel(
      taskId: 1,
      taskName: 'Test Task',
      taskDescription: 'Test Description',
      isCompleted: false,
    );
  });

  group(
    'PostTaskUseCase',
    () {
      test('should return true when postTask succeeds', () async {
        // Arrange
        when(mockPostTaskRepository.postTask(task))
            .thenAnswer((_) async => true);

        // Act
        final result = await postTaskUseCase.postTask(task);

        // Assert
        expect(result, true);
        verify(mockPostTaskRepository.postTask(task)).called(1);
      });

      test('should return false when postTask fails', () async {
        // Arrange
        when(mockPostTaskRepository.postTask(task))
            .thenAnswer((_) async => false);

        // Act
        final result = await postTaskUseCase.postTask(task);

        // Assert
        expect(result, false);
        verify(mockPostTaskRepository.postTask(task)).called(1);
      });
    },
  );
}
