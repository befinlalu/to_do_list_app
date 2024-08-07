import 'package:flutter/material.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';

class TaskTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool isError;
  final Function() callBack;
  const TaskTextFieldWidget({
    super.key,
    required this.controller,
    required this.isError,
    required this.title,
    required this.callBack,
  });

  @override
  State<TaskTextFieldWidget> createState() => _TaskTextFieldWidgetState();
}

class _TaskTextFieldWidgetState extends State<TaskTextFieldWidget> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(5),
        border: Border.all(
          color: widget.isError
              ? redColor
              : Theme.of(context).colorScheme.secondary,
        ),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              border: Border.all(
                color: widget.isError
                    ? redColor
                    : Theme.of(context).colorScheme.secondary,
              ),
              color: widget.isError
                  ? redColor
                  : Theme.of(context).colorScheme.secondary,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                maxLines: 2,
                widget.title,
                style: TextStyle(
                  color: textColor1,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                onChanged: (value) => widget.callBack(),
                onSubmitted: (value) => widget.callBack(),
                style: TextStyle(
                  color: textColor1,
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                  hintText: "Describe your assignment in a few words",
                  hintStyle: TextStyle(
                    color: textColor2,
                    fontSize: 12,
                  ),
                ),
                focusNode: myFocusNode,
                onTapOutside: (event) => myFocusNode.unfocus(),
                textCapitalization: TextCapitalization.words,
                cursorColor: textColor1,
                controller: widget.controller,
                maxLength: 20,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
