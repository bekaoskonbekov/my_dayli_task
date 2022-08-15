import 'package:my_daily_task/features/domain/entities/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';

class GetNotificationTaskUseCase {
  final LocalRepository localRepository;

  GetNotificationTaskUseCase({required this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.getNotification(task);
  }
}
