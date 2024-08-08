import 'package:to_do_list_app/features/task_management/domain/usecase/complete_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart'; // Ensure you import mockito for mocking

void main() {
  late CompleteTaskUsecase completeTaskUseCase;
  late MockCompleteTaskRepository mockCompleteTaskRepository;
  late int taskId;

  setUp(() {
    mockCompleteTaskRepository = MockCompleteTaskRepository();
    completeTaskUseCase = CompleteTaskUsecase(mockCompleteTaskRepository);
    taskId = 1;
  });

  group(
    'CompleteTaskUseCase',
    () {
      test('should return true when completeTask succeeds', () async {
        // Arrange
        when(mockCompleteTaskRepository.completeTask(taskId))
            .thenAnswer((_) async => true);

        // Act
        final result = await completeTaskUseCase.completeTask(taskId);

        // Assert
        expect(result, true);
        verify(mockCompleteTaskRepository.completeTask(taskId)).called(1);
      });

      test('should return false when completeTask fails', () async {
        // Arrange
        when(mockCompleteTaskRepository.completeTask(taskId))
            .thenAnswer((_) async => false);

        // Act
        final result = await completeTaskUseCase.completeTask(taskId);

        // Assert
        expect(result, false);
        verify(mockCompleteTaskRepository.completeTask(taskId)).called(1);
      });
    },
  );
}
