import 'package:to_do_list_app/features/task_management/domain/repository/complete_task_repository.dart';

class CompleteTaskUsecase {
  final CompleteTaskRepository completeTaskRepository;

  CompleteTaskUsecase(this.completeTaskRepository);

  Future<bool> completeTask(int taskId) {
    return completeTaskRepository.completeTask(taskId);
  }
}
