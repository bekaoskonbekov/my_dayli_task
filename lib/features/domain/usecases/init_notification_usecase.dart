import 'package:my_daily_task/features/domain/entities/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';

class InitNotificationUceCase {
  final LocalRepository localRepository;

  InitNotificationUceCase({required this.localRepository});
  Future<void> call() {
    return localRepository.initNotification();
  }
}