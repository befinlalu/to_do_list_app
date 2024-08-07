import 'package:flutter/material.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';
import 'package:to_do_list_app/core/widgets/custom_long_button.dart';
import 'package:to_do_list_app/core/widgets/task_description_textfield_widget.dart';
import 'package:to_do_list_app/core/widgets/task_textfield_widget.dart';

enum ValidationField {
  name,
  description,
}

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  bool nameError = false;
  bool descError = false;

  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
  }

  void nameCallBack() {
    validateField(context, ValidationField.name);
  }

  void descCallBack() {
    validateField(context, ValidationField.description);
  }

  void validateField(BuildContext context, ValidationField field) {
    switch (field) {
      case ValidationField.name:
        if (nameController.text == "") {
          setState(() {
            nameError = true;
          });
        } else {
          setState(() {
            nameError = false;
          });
        }
        break;
      case ValidationField.description:
        if (descriptionController.text == "") {
          setState(() {
            descError = true;
          });
        } else {
          setState(() {
            descError = false;
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(14),
        height: 400,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Divider(
              height: 20,
              color: Colors.transparent,
            ),
            Text(
              'New Task',
              style: TextStyle(
                color: textColor1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(
              height: 20,
              color: Colors.transparent,
            ),
            TaskTextFieldWidget(
              title: "Task Name",
              controller: nameController,
              isError: nameError,
              callBack: nameCallBack,
            ),
            const Divider(
              height: 15,
              color: Colors.transparent,
            ),
            TaskDescriptionTextFieldWidget(
              title: "Task Description",
              controller: descriptionController,
              isError: descError,
              callBack: descCallBack,
            ),
            const Divider(
              height: 30,
              color: Colors.transparent,
            ),
            CustomLongButton(
              fontSize: 25,
              height: 40,
              borderColor: Theme.of(context).colorScheme.secondary,
              radius: 45,
              width: 200,
              buttonColor: Theme.of(context).colorScheme.tertiary,
              buttonTitle: "create",
              isLoading: false,
              textColor: textColor1,
              onPressed: () {
                validateField(context, ValidationField.name);
                validateField(context, ValidationField.description);
              },
            ),
          ],
        ),
      ),
    );
  }
}
