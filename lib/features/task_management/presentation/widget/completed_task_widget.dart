import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/no_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/task_tile_widget.dart';

class CompletedTaskWidget extends StatelessWidget {
  const CompletedTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      // Listen to changes in the Hive box containing TaskModel objects
      valueListenable: Hive.box<TaskModel>('tasksBox').listenable(),
      builder: (context, Box<TaskModel> box, _) {
        // Convert the box values to a list of tasks
        final tasks = box.values.toList();
        // Filter the list to include only completed tasks
        final incompleteTasks =
            tasks.where((task) => task.isCompleted).toList();

        // If there are completed tasks, display them in a ListView
        return (incompleteTasks.isNotEmpty)
            ? ListView.builder(
                itemCount: incompleteTasks
                    .length, // Set the number of items in the list
                itemBuilder: (context, index) => TaskTileWidget(
                  task: incompleteTasks[
                      index], // Create a tile for each completed task
                ),
              )
            : const NoTaskWidget(
                title:
                    "No completed tasks", // Display a message if there are no completed tasks
              );
      },
    );
  }
}
