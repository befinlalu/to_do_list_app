import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

class PostTaskService {
  final Box<TaskModel> tasksBox;

  PostTaskService(this.tasksBox);
  Future<bool> postTask(TaskModel task) async {
    try {
      await tasksBox.put(task.taskId, task);
      return true;
    } catch (e) {
      return false;
    }
  }
}
