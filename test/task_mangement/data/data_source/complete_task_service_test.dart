import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/complete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockBox<TaskModel> mockTasksBox;
  late CompleteTaskService completeTaskService;

  setUp(() {
    mockTasksBox = MockBox<TaskModel>();
    completeTaskService = CompleteTaskService(mockTasksBox);
  });

  group('CompleteTaskService', () {
    const int taskId = 1;
    const task = TaskModel(
      taskId: taskId,
      taskName: 'Test Task',
      taskDescription: 'Test Description',
      isCompleted: false,
    );
    final updatedTask = task.copyWith(isCompleted: true);

    test('should return true when task is successfully marked as completed',
        () async {
      // Arrange
      when(mockTasksBox.get(taskId)).thenReturn(task);
      when(mockTasksBox.put(taskId, updatedTask))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await completeTaskService.completeTask(taskId);

      // Assert
      expect(result, true);
      verify(mockTasksBox.get(taskId)).called(1);
      verify(mockTasksBox.put(taskId, updatedTask)).called(1);
    });

    test('should return false when task is not found', () async {
      // Arrange
      when(mockTasksBox.get(taskId)).thenReturn(null);

      // Act
      final result = await completeTaskService.completeTask(taskId);

      // Assert
      expect(result, false);
      verify(mockTasksBox.get(taskId)).called(1);
      verifyNever(mockTasksBox.put(taskId, updatedTask));
    });

    test('should return false when an exception occurs', () async {
      // Arrange
      when(mockTasksBox.get(taskId))
          .thenThrow(Exception('Failed to complete task'));

      // Act
      final result = await completeTaskService.completeTask(taskId);

      // Assert
      expect(result, false);
      verify(mockTasksBox.get(taskId)).called(1);
    });
  });
}
