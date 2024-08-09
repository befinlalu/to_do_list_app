import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';
import 'package:to_do_list_app/core/utils/task_id_service.dart';
import 'package:to_do_list_app/core/widgets/custom_long_button.dart';
import 'package:to_do_list_app/core/widgets/task_description_textfield_widget.dart';
import 'package:to_do_list_app/core/widgets/task_textfield_widget.dart';

import 'package:to_do_list_app/features/task_management/presentation/bloc/add_task_bloc/add_task_bloc.dart';
import 'package:to_do_list_app/injection_container.dart';

// Used for validation for textfields
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

  late AddTaskBloc bloc;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    bloc = sl<AddTaskBloc>(); // Injecting the AddTaskBloc using GetIt
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose(); // Disposing the controllers to free resources
    descriptionController.dispose();
  }

  // Callback functions for validating name and description fields
  void nameCallBack() {
    validateField(context, ValidationField.name);
  }

  void descCallBack() {
    validateField(context, ValidationField.description);
  }

  // Validation function for name and description fields
  void validateField(BuildContext context, ValidationField field) {
    switch (field) {
      case ValidationField.name:
        if (nameController.text == "") {
          setState(() {
            nameError = true; // Set error if the name field is empty
          });
        } else {
          setState(() {
            nameError = false; // Clear error if the name field is not empty
          });
        }
        break;
      case ValidationField.description:
        if (descriptionController.text == "") {
          setState(() {
            descError = true; // Set error if the description field is empty
          });
        } else {
          setState(() {
            descError =
                false; // Clear error if the description field is not empty
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskBloc, AddTaskState>(
      bloc: bloc,
      listener: (context, state) {
        // Close the bottom sheet if the task is successfully created
        if (state is PostTaskSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return (state is! PostTaskLoadingState)
            ? Padding(
                padding:
                    MediaQuery.of(context).viewInsets, // Adjust for keyboard
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
                        callBack:
                            nameCallBack, // Trigger validation when the name field changes
                      ),
                      const Divider(
                        height: 15,
                        color: Colors.transparent,
                      ),
                      TaskDescriptionTextFieldWidget(
                        title: "Task Description",
                        controller: descriptionController,
                        isError: descError,
                        callBack:
                            descCallBack, // Trigger validation when the description field changes
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
                        onPressed: () async {
                          // Validate fields before creating the task
                          validateField(context, ValidationField.name);
                          validateField(context, ValidationField.description);
                          if (nameController.text != "" &&
                              descriptionController.text != "") {
                            int taskId = await TaskIdService
                                .getNextTaskId(); // Generate a unique task ID
                            bloc.add(
                              PostTaskEvent(
                                taskName: nameController.text,
                                taskDescription: descriptionController.text,
                                taskId: taskId, // Pass the generated task ID
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child:
                    CircularProgressIndicator(), // Show a loading indicator while the task is being created
              );
      },
    );
  }
}
