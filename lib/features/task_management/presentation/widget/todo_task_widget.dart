import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/no_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/task_tile_widget.dart';

class TodoTaskWidget extends StatelessWidget {
  const TodoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TaskModel>('tasksBox').listenable(),
      builder: (context, Box<TaskModel> box, _) {
        final tasks = box.values.toList();
        final incompleteTasks =
            tasks.where((task) => !task.isCompleted).toList();

        return (incompleteTasks.isNotEmpty)
            ? ListView.builder(
                itemCount: incompleteTasks.length,
                itemBuilder: (context, index) => TaskTileWidget(
                  task: incompleteTasks[index],
                ),
              )
            : const NoTaskWidget(
                title: "No pending tasks",
              );
      },
    );
  }
}
