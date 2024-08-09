import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/complete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/delete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/post_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/data/repository/complete_task_repository_implementation.dart';
import 'package:to_do_list_app/features/task_management/data/repository/delete_task_repository_implementation.dart';
import 'package:to_do_list_app/features/task_management/data/repository/post_task_repository_implementation.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/complete_task_repository.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/delete_task_repository.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/post_task_repository.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/complete_task_usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/delete_task_usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/post_task_usecase.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/add_task_bloc/add_task_bloc.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/complete_task_bloc/complete_task_bloc.dart';
import 'package:to_do_list_app/features/task_management/presentation/bloc/delete_task_bloc/delete_task_bloc.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  sl.registerSingleton<Box<TaskModel>>(Hive.box<TaskModel>('tasksBox'));
  sl.registerFactory(() => AddTaskBloc(sl()));
  sl.registerSingleton<PostTaskService>(PostTaskService(sl()));
  sl.registerLazySingleton<PostTaskRepository>(
      () => PostTaskRepositoryImplementation(sl()));
  sl.registerLazySingleton(() => PostTaskUsecase(sl()));

  sl.registerSingleton<DeleteTaskService>(DeleteTaskService(sl()));
  sl.registerSingleton<DeleteTaskRepository>(
      DeleteTaskRepositoryImplementation(sl()));
  sl.registerSingleton<DeleteTaskUsecase>(DeleteTaskUsecase(sl()));
  sl.registerFactory<DeleteTaskBloc>(() => DeleteTaskBloc(sl()));

  sl.registerSingleton<CompleteTaskService>(CompleteTaskService(sl()));
  sl.registerSingleton<CompleteTaskRepository>(
      CompleteTaskRepositoryImplementation(sl()));
  sl.registerSingleton<CompleteTaskUsecase>(CompleteTaskUsecase(sl()));
  sl.registerFactory<CompleteTaskBloc>(() => CompleteTaskBloc(sl()));
}
