import 'package:to_do_list_app/features/task_management/data/data_source/delete_task_service.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/delete_task_repository.dart';

class DeleteTaskRepositoryImplementation implements DeleteTaskRepository {
  final DeleteTaskService deleteTaskService;

  DeleteTaskRepositoryImplementation(this.deleteTaskService);
  @override
  Future<bool> deleteTask(int taskId) async {
    try {
      await deleteTaskService.deleteTask(taskId);
      return true;
    } catch (e) {
      return false;
    }
  }
}
