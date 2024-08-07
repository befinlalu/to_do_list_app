import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';

class TaskTileWidget extends StatefulWidget {
  const TaskTileWidget({super.key});

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget>
    with TickerProviderStateMixin {
  late SlidableController slidableController;
  @override
  void initState() {
    super.initState();
    slidableController = SlidableController(this);
  }

  @override
  void dispose() {
    super.dispose();
    slidableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Slidable(
        controller: slidableController,
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 1,
              padding: EdgeInsets.zero,
              onPressed: (context) {},
              backgroundColor: redColor,
              foregroundColor: const Color(0xFFA2A2B5),
              icon: Icons.delete,
            ),
            SlidableAction(
              flex: 1,
              padding: EdgeInsets.zero,
              onPressed: (context) {},
              backgroundColor: greenColor,
              foregroundColor: const Color(0xFFA2A2B5),
              icon: Icons.done_outline,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => slidableController.openStartActionPane(),
          child: Container(
            padding: const EdgeInsets.all(14),
            height: 90,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 25,
                  color: Colors.transparent,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      maxLines: 1,
                      "Task Name",
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
                    "Description is something",
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
