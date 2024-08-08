import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

class DeleteTaskService {
  final Box<TaskModel> tasksBox;

  DeleteTaskService(this.tasksBox);
  Future<bool> deleteTask(int taskId) async {
    try {
      await tasksBox.delete(taskId);
      return true;
    } catch (e) {
      return false;
    }
  }
}
