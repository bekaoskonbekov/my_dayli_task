import 'package:my_daily_task/features/domain/entities/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';

class GetAllTaskUseCase {
  final LocalRepository localRepository;

  GetAllTaskUseCase({required this.localRepository});
  Future<List<TaskEntity>> call() {
    return localRepository.getAllTask();
  }
}
