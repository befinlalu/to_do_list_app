import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

class PostTaskService {
  final Box<TaskModel> tasksBox;

  PostTaskService(this.tasksBox);
  Future<void> postTask(TaskModel task) async {
    await tasksBox.put(task.taskId, task);
  }
}
