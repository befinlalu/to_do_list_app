import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:to_do_list_app/features/task_management/data/repository/complete_task_repository_implementation.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late CompleteTaskRepositoryImplementation repository;
  late MockCompleteTaskService mockCompleteTaskService;
  late int taskId; // Use an appropriate task ID

  setUp(() {
    taskId = 1;
    mockCompleteTaskService = MockCompleteTaskService();
    repository = CompleteTaskRepositoryImplementation(mockCompleteTaskService);
  });

  group(
    'CompleteTaskRepositoryImplementation',
    () {
      test('should return true when completeTask is successful', () async {
        // Arrange
        when(mockCompleteTaskService.completeTask(taskId))
            .thenAnswer((_) async => true);

        // Act
        final result = await repository.completeTask(taskId);

        // Assert
        expect(result, true);
        verify(mockCompleteTaskService.completeTask(taskId)).called(1);
      });

      test('should return false when completeTask throws an exception',
          () async {
        // Arrange
        when(mockCompleteTaskService.completeTask(taskId))
            .thenThrow(Exception('Failed to complete task'));

        // Act
        final result = await repository.completeTask(taskId);

        // Assert
        expect(result, false);
        verify(mockCompleteTaskService.completeTask(taskId)).called(1);
      });
    },
  );
}
