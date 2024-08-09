import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';
import 'package:to_do_list_app/features/task_management/domain/entity/task_entity.dart';

import 'package:to_do_list_app/features/task_management/presentation/bloc/complete_task_bloc/complete_task_bloc.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/delete_task_bloc/delete_task_bloc.dart';
import 'package:to_do_list_app/injection_container.dart';

class TaskTileWidget extends StatefulWidget {
  final TaskEntity task; // TaskEntity object passed to the widget
  const TaskTileWidget({
    super.key,
    required this.task,
  });

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget>
    with TickerProviderStateMixin {
  late SlidableController slidableController;
  late DeleteTaskBloc deleteBloc;
  late CompleteTaskBloc completeBloc;

  @override
  void initState() {
    super.initState();
    // Initialize SlidableController and BLoCs
    slidableController = SlidableController(this);
    deleteBloc = sl<DeleteTaskBloc>();
    completeBloc = sl<CompleteTaskBloc>();
  }

  @override
  void dispose() {
    // Dispose of SlidableController
    slidableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14.0,
        left: 14,
        right: 14,
      ),
      child: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            // Delete action for the task
            SlidableAction(
              flex: 1,
              padding: EdgeInsets.zero,
              onPressed: (context) {
                deleteBloc.add(DeleteTask(taskId: widget.task.taskId));
              },
              backgroundColor: redColor,
              foregroundColor: const Color(0xFFA2A2B5),
              icon: Icons.delete,
            ),
            // Complete action for incomplete tasks
            (!widget.task.isCompleted)
                ? SlidableAction(
                    flex: 1,
                    padding: EdgeInsets.zero,
                    onPressed: (context) {
                      completeBloc
                          .add(CompleteTask(taskId: widget.task.taskId));
                    },
                    backgroundColor: greenColor,
                    foregroundColor: const Color(0xFFA2A2B5),
                    icon: Icons.done_outline,
                  )
                : const SizedBox(),
          ],
        ),
        child: GestureDetector(
          // Open the Slidable action pane when tapped
          onTap: () => slidableController.openStartActionPane(),
          child: Container(
            padding: const EdgeInsets.all(14),
            height: 90,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 1,
                color: widget.task.isCompleted
                    ? greenColor
                    : Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 23,
                  color: Colors.transparent,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      maxLines: 1,
                      widget.task.taskName,
                      style: TextStyle(
                        color: textColor1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                Container(
                  color: Colors.transparent,
                  height: 30,
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    widget.task.taskDescription,
                    style: TextStyle(
                      color: textColor1,
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
