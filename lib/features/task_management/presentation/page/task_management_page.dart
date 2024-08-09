import 'package:flutter/material.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/add_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/all_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/completed_task_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/selection_bar_widget.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/todo_task_widget.dart';

class TaskManagementPage extends StatelessWidget {
  const TaskManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Method to return the list of pages (tabs)
    List<Widget> pages() {
      return const [
        AllTaskWidget(), // Tab for displaying all tasks
        TodoTaskWidget(), // Tab for displaying to-do tasks
        CompletedTaskWidget(), // Tab for displaying completed tasks
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
            animationDuration: const Duration(
                milliseconds: 500), // Control tab transition animation
            length: pages()
                .length, // Set the number of tabs based on the number of pages
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Divider(
                  height: 35,
                  color: Colors.transparent,
                ),
                const SelectionBarWidget(), // Widget for selecting the different task views (tabs)
                const Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
                SizedBox(
                  height: 600, // Fixed height for the TabBarView
                  child: TabBarView(
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable swipe gesture to switch tabs
                    children:
                        pages(), // Use the pages() method to provide the content for each tab
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          isScrollControlled:
              true, // Allow the bottom sheet to adjust to the height of its content
          backgroundColor: Colors
              .transparent, // Make the bottom sheet background transparent
          context: context,
          builder: (context) =>
              const AddTaskWidget(), // Show AddTaskWidget in a modal bottom sheet
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
