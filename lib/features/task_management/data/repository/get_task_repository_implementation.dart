import 'package:hive/hive.dart';
import 'package:to_do_list_app/features/task_management/data/data_source/get_task_serivce.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/get_task_repository.dart';

class GetTaskRepositoryImplementation implements GetTaskRepository {
  final GetTaskService getTaskService;

  GetTaskRepositoryImplementation(this.getTaskService);

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final tasks = await getTaskService.getTasks();
      return tasks;
    } on HiveError catch (e) {
      print('HiveError: $e');
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
