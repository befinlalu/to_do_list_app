import 'package:to_do_list_app/core/usecase/usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/post_task_repository.dart';

class PostTaskUsecase implements UseCase<bool, void> {
  final PostTaskRepository postTaskRepository;

  PostTaskUsecase(this.postTaskRepository);

  @override
  Future<bool> call({void params}) {
    return postTaskRepository.postTask();
  }
}
