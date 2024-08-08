import 'package:to_do_list_app/core/usecase/usecase.dart';
import 'package:to_do_list_app/features/task_management/domain/repository/complete_task_repository.dart';

class CompleteTaskUsecase implements UseCase<bool, void> {
  final CompleteTaskRepository completeTaskRepository;

  CompleteTaskUsecase(this.completeTaskRepository);
  @override
  Future<bool> call({void params}) {
    return completeTaskRepository.completeTask();
  }
}
