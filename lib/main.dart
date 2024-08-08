import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/config/theme/color_theme.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/add_task_bloc/add_task_bloc.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/complete_task_bloc/complete_task_bloc.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/delete_task_bloc/delete_task_bloc.dart';
import 'package:to_do_list_app/features/task_management/presentation/page/task_management_page.dart';
import 'package:to_do_list_app/injection_container.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasksBox');
  initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AddTaskBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<DeleteTaskBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CompleteTaskBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const TaskManagementPage(),
      ),
    );
  }
}
