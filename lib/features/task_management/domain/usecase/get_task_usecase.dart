import 'package:to_do_list_app/core/usecase/usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/entity/task_entity.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/get_task_repository.dart';

class GetTaskUsecase implements UseCase<List<TaskEntity>, void> {
  final GetTaskRepository getTaskRepository;

  GetTaskUsecase(this.getTaskRepository);
  @override
  Future<List<TaskEntity>> call({void params}) {
    return getTaskRepository.getTasks();
  }
}
