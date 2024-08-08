import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/data/repository/delete_task_repository_implementation.dart';

import '../../helpers/test_helper.mocks.dart';

// Create a Mock class for DeleteTaskService

void main() {
  late DeleteTaskRepositoryImplementation repository;
  late MockDeleteTaskService mockDeleteTaskService;
  late int taskId;

  setUp(() {
    taskId = 1;
    mockDeleteTaskService = MockDeleteTaskService();
    repository = DeleteTaskRepositoryImplementation(mockDeleteTaskService);
  });
  group(
    'DeleteTaskRepositoryImplementation',
    () {
      test('should return true when deleteTask is successful', () async {
        // Arrange
        when(mockDeleteTaskService.deleteTask(taskId))
            .thenAnswer((_) async => true);

        // Act
        final result = await repository.deleteTask(taskId);

        // Assert
        expect(result, true);
        verify(mockDeleteTaskService.deleteTask(taskId)).called(1);
      });

      test('should return false when deleteTask throws an exception', () async {
        // Arrange
        when(mockDeleteTaskService.deleteTask(taskId))
            .thenThrow(Exception('Failed to delete task'));

        // Act
        final result = await repository.deleteTask(taskId);

        // Assert
        expect(result, false);
        verify(mockDeleteTaskService.deleteTask(taskId)).called(1);
      });
    },
  );
}
