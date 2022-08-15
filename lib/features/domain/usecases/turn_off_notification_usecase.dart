import 'package:my_daily_task/features/domain/entities/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';

class TurnOffNotificationTaskUseCase {
  final LocalRepository localRepository;

  TurnOffNotificationTaskUseCase({required this.localRepository});
  Future<void> call(TaskEntity task) {
    return localRepository.getOnNotification(task);
  }
}
