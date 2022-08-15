import 'package:my_daily_task/features/data/local_data_source/local_data_source_impl.dart';
import 'package:my_daily_task/features/domain/entities/task_entity.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource localDataSource;

  LocalRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addNewTask(TaskEntity task) async =>
      localDataSource.addNewTask(task);

  @override
  Future<void> deleteTask(TaskEntity task) async =>
      localDataSource.deleteTask(task);

  @override
  Future<List<TaskEntity>> getAllTask() async => localDataSource.getAllTask();

  @override
  Future<void> getNotification(TaskEntity task) async =>
      localDataSource.getNotification(task);

  @override
  Future<void> getOnNotification(TaskEntity task) async =>
      localDataSource.getOnNotification(task);

  @override
  Future<Database> openDatabase() async => localDataSource.openDatabase();
  @override
  Future<void> updateTask(TaskEntity task) async =>
      localDataSource.updateTask(task);

  @override
  Future<void> initNotification() async => localDataSource.initNotification();
}
