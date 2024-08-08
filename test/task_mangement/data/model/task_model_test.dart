import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/domain/entity/task_entity.dart';

void main() {
  TaskModel taskModel = const TaskModel(
    taskName: "Cooking",
    taskDescription: "Make breakfast",
    taskId: 12333,
    isCompleted: false,
  );

  test(
    "Should be a subclass of TaskEntity",
    () {
      //assert
      expect(taskModel, isA<TaskEntity>());
    },
  );
}
