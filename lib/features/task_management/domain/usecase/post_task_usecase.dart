import 'package:to_do_list_app/features/task_management/data/model/task_model.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/post_task_repository.dart';

class PostTaskUsecase {
  final PostTaskRepository postTaskRepository;

  PostTaskUsecase(this.postTaskRepository);

  Future<bool> postTask(TaskModel task) {
    return postTaskRepository.postTask(task);
  }
}
