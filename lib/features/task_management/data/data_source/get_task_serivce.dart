import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

class GetTaskService {
  final Box<TaskModel> tasksBox;

  GetTaskService(this.tasksBox);

  Future<List<TaskModel>> getTasks() async {
    return tasksBox.values.toList();
  }
}
