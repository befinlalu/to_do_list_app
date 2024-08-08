import 'package:to_do_list_app/features/task_management/domain/usecase/delete_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart'; // Ensure you import mockito for mocking

void main() {
  late DeleteTaskUsecase deleteTaskUseCase;
  late MockDeleteTaskRepository mockDeleteTaskRepository;
  late int taskId;

  setUp(() {
    mockDeleteTaskRepository = MockDeleteTaskRepository();
    deleteTaskUseCase = DeleteTaskUsecase(mockDeleteTaskRepository);
    taskId = 1;
  });

  group(
    'DeleteTaskUseCase',
    () {
      test('should return true when deleteTask succeeds', () async {
        // Arrange
        when(mockDeleteTaskRepository.deleteTask(taskId))
            .thenAnswer((_) async => true);

        // Act
        final result = await deleteTaskUseCase.deleteTask(taskId);

        // Assert
        expect(result, true);
        verify(mockDeleteTaskRepository.deleteTask(taskId)).called(1);
      });

      test('should return false when deleteTask fails', () async {
        // Arrange
        when(mockDeleteTaskRepository.deleteTask(taskId))
            .thenAnswer((_) async => false);

        // Act
        final result = await deleteTaskUseCase.deleteTask(taskId);

        // Assert
        expect(result, false);
        verify(mockDeleteTaskRepository.deleteTask(taskId)).called(1);
      });
    },
  );
}
