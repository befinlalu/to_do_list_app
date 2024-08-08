import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/no_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/task_tile_widget.dart';

class AllTaskWidget extends StatefulWidget {
  const AllTaskWidget({super.key});

  @override
  State<AllTaskWidget> createState() => _AllTaskWidgetState();
}

class _AllTaskWidgetState extends State<AllTaskWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TaskModel>('tasksBox').listenable(),
      builder: (context, Box<TaskModel> box, _) {
        final tasks = box.values.toList();
        return (tasks.isNotEmpty)
            ? ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => TaskTileWidget(
                  task: tasks[index],
                ),
              )
            : const NoTaskWidget(
                title: "No avilable tasks",
              );
      },
    );
  }
}
