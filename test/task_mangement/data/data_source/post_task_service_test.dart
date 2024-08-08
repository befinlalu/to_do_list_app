import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/post_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockBox<TaskModel> mockTasksBox;
  late PostTaskService postTaskService;

  setUp(() {
    mockTasksBox = MockBox<TaskModel>();
    postTaskService = PostTaskService(mockTasksBox);
  });

  group('PostTaskService', () {
    const task = TaskModel(
        taskId: 1,
        taskName: 'Test Task',
        taskDescription: 'Test Description',
        isCompleted: false);

    test('should return true when task is successfully posted', () async {
      // Arrange
      when(mockTasksBox.put(task.taskId, task))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await postTaskService.postTask(task);

      // Assert
      expect(result, true);
      verify(mockTasksBox.put(task.taskId, task)).called(1);
    });

    test('should return false when an exception occurs', () async {
      // Arrange
      when(mockTasksBox.put(task.taskId, task))
          .thenThrow(Exception('Failed to post task'));

      // Act
      final result = await postTaskService.postTask(task);

      // Assert
      expect(result, false);
      verify(mockTasksBox.put(task.taskId, task)).called(1);
    });
  });
}
