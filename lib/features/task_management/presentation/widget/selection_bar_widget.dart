import 'package:flutter/material.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';

class SelectionBarWidget extends StatelessWidget {
  const SelectionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.secondary,
          )),
      height: 60,
      child: TabBar(
        dividerColor: Colors.transparent,
        isScrollable: false,
        enableFeedback: true,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Theme.of(context).colorScheme.secondary,
        indicator: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: .3,
            ),
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16)),
        labelStyle: TextStyle(color: textColor1),
        unselectedLabelStyle: TextStyle(
          color: textColor1,
        ),
        tabs: [
          Tab(
            child: SizedBox(
              height: (30),
              child: Center(
                child: Text(
                  "All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor1,
                  ),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              height: (30),
              child: Center(
                child: Text(
                  "Pending",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor1,
                  ),
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              height: (30),
              child: Center(
                child: Text(
                  "Completed",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
