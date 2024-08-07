import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/task_management/presentation/widget/task_tile_widget.dart';

class CompletedTaskWidget extends StatelessWidget {
  const CompletedTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => TaskTileWidget(),
    );
  }
}
