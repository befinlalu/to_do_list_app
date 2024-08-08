import 'package:to_do_list_app/features/task_management/domain/entity/task_entity.dart';

abstract class GetTaskRepository {
  Future<List<TaskEntity>> getTasks();
}
