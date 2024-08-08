import 'package:to_do_list_app/core/usecase/usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/delete_task_repository.dart';

class DeleteTaskUsecase implements UseCase<bool, void> {
  final DeleteTaskRepository deleteTaskRepository;

  DeleteTaskUsecase(this.deleteTaskRepository);
  @override
  Future<bool> call({void params}) {
    return deleteTaskRepository.deleteTask();
  }
}
