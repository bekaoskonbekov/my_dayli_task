import 'package:my_daily_task/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

class OpenDatabaseTaskUseCase {
  final LocalRepository localRepository;

  OpenDatabaseTaskUseCase({required this.localRepository});
  Future<Database> call() {
    return localRepository.openDatabase();
  }
}
