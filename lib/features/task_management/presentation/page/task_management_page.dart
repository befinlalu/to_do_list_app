import 'package:flutter/material.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/add_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/all_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/completed_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/selection_bar_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/todo_task_widget.dart';

class TaskManagementPage extends StatefulWidget {
  const TaskManagementPage({super.key});

  @override
  State<TaskManagementPage> createState() => _TaskManagementPageState();
}

class _TaskManagementPageState extends State<TaskManagementPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages() {
      return const [
        AllTaskWidget(),
        TodoTaskWidget(),
        CompletedTaskWidget(),
      ];
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text("To-Do List App"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: ListView(
        children: [
          DefaultTabController(
            animationDuration: const Duration(milliseconds: 500),
            length: pages().length,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Divider(
                    height: 35,
                    color: Colors.transparent,
                  ),
                  const SelectionBarWidget(),
                  const Divider(
                    height: 20,
                    color: Colors.transparent,
                  ),
                  SizedBox(
                    height: 600,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: pages(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => AddTaskWidget(),
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.add,
          color: textColor1,
          size: 30,
        ),
      ),
    );
  }
}
