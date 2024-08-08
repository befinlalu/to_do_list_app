import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';

abstract class PostTaskRepository {
  Future<bool> postTask(TaskModel task);
}
