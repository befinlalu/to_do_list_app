import 'package:to_do_list_app/features/task_management/domain/repository/delete_task_repository.dart';

class DeleteTaskUsecase {
  final DeleteTaskRepository deleteTaskRepository;

  DeleteTaskUsecase(this.deleteTaskRepository);
  Future<bool> deleteTask(int taskId) {
    return deleteTaskRepository.deleteTask(taskId);
  }
}
