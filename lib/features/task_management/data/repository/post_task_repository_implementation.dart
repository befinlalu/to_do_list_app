import 'package:to_do_list_app/features/task_management/data/data_source/post_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/post_task_repository.dart';

class PostTaskRepositoryImplementation implements PostTaskRepository {
  final PostTaskService postTaskService;
  final TaskModel taskModel;

  PostTaskRepositoryImplementation(
    this.postTaskService,
    this.taskModel,
  );

  @override
  Future<bool> postTask() async {
    try {
      await postTaskService.postTask(taskModel);
      return true;
    } catch (e) {
      // Log the error or handle it accordingly
      print('Error posting task: $e');
      return false;
    }
  }
}
