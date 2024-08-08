import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

class CompleteTaskService {
  final Box<TaskModel> tasksBox;

  CompleteTaskService(this.tasksBox);
  Future<bool> completeTask(int taskId) async {
    try {
      final task = tasksBox.get(taskId);
      if (task != null) {
        final updatedTask = task.copyWith(isCompleted: true);
        await tasksBox.put(taskId, updatedTask);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
