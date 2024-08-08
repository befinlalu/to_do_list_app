import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/data/repository/post_task_repository_implementation.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockPostTaskService mockPostTaskService;
  late PostTaskRepositoryImplementation postTaskRepository;
  late TaskModel task;

  setUp(() {
    mockPostTaskService = MockPostTaskService();
    task = const TaskModel(
      taskId: 1,
      taskName: 'Test Task',
      taskDescription: 'Test Description',
      isCompleted: false,
    );
    postTaskRepository = PostTaskRepositoryImplementation(
      mockPostTaskService,
    );
  });

  group('PostTaskRepositoryImplementation', () {
    test('should return true when task is successfully posted', () async {
      // Arrange
      when(mockPostTaskService.postTask(task)).thenAnswer((_) async => true);

      // Act
      final result = await postTaskRepository.postTask(task);

      // Assert
      expect(result, true);
      verify(mockPostTaskService.postTask(task)).called(1);
    });

    test('should return false when an exception occurs', () async {
      // Arrange
      when(mockPostTaskService.postTask(task))
          .thenThrow(Exception('Failed to post task'));

      // Act
      final result = await postTaskRepository.postTask(task);

      // Assert
      expect(result, false);
      verify(mockPostTaskService.postTask(task)).called(1);
    });
  });
}
