import 'package:to_do_list_app/features/task_management/data/data_source/complete_task_service.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/complete_task_repository.dart';

class CompleteTaskRepositoryImplementation implements CompleteTaskRepository {
  final CompleteTaskService completeTaskService;
  final int taskId;

  CompleteTaskRepositoryImplementation(this.completeTaskService, this.taskId);
  @override
  Future<bool> completeTask() async {
    try {
      await completeTaskService.completeTask(taskId);
      return true;
    } catch (e) {
      // Log the error or handle it accordingly
      print('Error posting task: $e');
      return false;
    }
  }
}
