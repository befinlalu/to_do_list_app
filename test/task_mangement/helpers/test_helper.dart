import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/complete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/delete_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/post_task_service.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/complete_task_repository.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/delete_task_repository.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/post_task_repository.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/complete_task_usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/delete_task_usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/usecase/post_task_usecase.dart';

@GenerateMocks([
  PostTaskRepository,
  CompleteTaskRepository,
  DeleteTaskRepository,
  PostTaskService,
  CompleteTaskService,
  DeleteTaskService,
  Box,
  PostTaskUsecase,
  CompleteTaskUsecase,
  DeleteTaskUsecase,
])
void main() {}
