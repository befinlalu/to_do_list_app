import 'package:to_do_list_app/features/task_management/data/data_source/post_task_service.dart';
import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/post_task_repository.dart';

class PostTaskRepositoryImplementation implements PostTaskRepository {
  final PostTaskService postTaskService;

  PostTaskRepositoryImplementation(
    this.postTaskService,
  );

  @override
  Future<bool> postTask(TaskModel task) async {
    try {
      await postTaskService.postTask(task);
      return true;
    } catch (e) {
      return false;
    }
  }
}
