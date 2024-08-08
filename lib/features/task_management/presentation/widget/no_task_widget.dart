import 'package:flutter/material.dart';

class NoTaskWidget extends StatelessWidget {
  final String title;
  const NoTaskWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
