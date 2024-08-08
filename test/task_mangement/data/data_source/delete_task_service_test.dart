import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/delete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockBox<TaskModel> mockTasksBox;
  late DeleteTaskService deleteTaskService;

  setUp(() {
    mockTasksBox = MockBox<TaskModel>();
    deleteTaskService = DeleteTaskService(mockTasksBox);
  });

  group('DeleteTaskService', () {
    const int taskId = 1;

    test('should return true when task is successfully deleted', () async {
      // Arrange
      when(mockTasksBox.delete(taskId)).thenAnswer((_) async => Future.value());

      // Act
      final result = await deleteTaskService.deleteTask(taskId);

      // Assert
      expect(result, true);
      verify(mockTasksBox.delete(taskId)).called(1);
    });

    test('should return false when an exception occurs', () async {
      // Arrange
      when(mockTasksBox.delete(taskId))
          .thenThrow(Exception('Failed to delete task'));

      // Act
      final result = await deleteTaskService.deleteTask(taskId);

      // Assert
      expect(result, false);
      verify(mockTasksBox.delete(taskId)).called(1);
    });
  });
}
