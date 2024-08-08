import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

class DeleteTaskService {
  final Box<TaskModel> tasksBox;

  DeleteTaskService(this.tasksBox);
  Future<void> deleteTask(int taskId) async {
    await tasksBox.delete(taskId);
  }
}
