import 'package:to_do_list_app/features/task_management/data/data_source/complete_task_service.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/complete_task_repository.dart';

class CompleteTaskRepositoryImplementation implements CompleteTaskRepository {
  final CompleteTaskService completeTaskService;

  CompleteTaskRepositoryImplementation(
    this.completeTaskService,
  );
  @override
  Future<bool> completeTask(int taskId) async {
    try {
      await completeTaskService.completeTask(taskId);
      return true;
    } catch (e) {
      // Log the error or handle it accordingly
      return false;
    }
  }
}
