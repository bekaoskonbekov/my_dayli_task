import 'package:get_it/get_it.dart';
import 'package:my_daily_task/features/data/local_data_source/local_data_source.dart';
import 'package:my_daily_task/features/data/local_data_source/local_data_source_impl.dart';
import 'package:my_daily_task/features/data/repositories/local_repository_impl.dart';
import 'package:my_daily_task/features/domain/repositories/local_repository.dart';
import 'package:my_daily_task/features/domain/usecases/add_task_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/delete_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/get_all_task.dart';
import 'package:my_daily_task/features/domain/usecases/get_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/init_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/open_database_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/turn_off_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/update_usecase.dart';
import 'package:my_daily_task/features/presentation/cubit/task_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => TaskCubit(
        getNotificationTaskUseCase: sl.call(),
        deleteTaskUseCase: sl.call(),
        addTaskUseCase: sl.call(),
        getAllTaskUseCase: sl.call(),
        updateTaskUseCase: sl.call(),
        openDatabaseTaskUseCase: sl.call(),
        turnOffNotificationTaskUseCase: sl.call(), 
        initNotificationUceCase: sl.call(),
      ));
  //ussecase
  sl.registerLazySingleton<InitNotificationUceCase>(
      () => InitNotificationUceCase(localRepository: sl.call()));
  sl.registerLazySingleton<AddTaskUseCase>(
      () => AddTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetAllTaskUseCase>(
      () => GetAllTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetNotificationTaskUseCase>(
      () => GetNotificationTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<OpenDatabaseTaskUseCase>(
      () => OpenDatabaseTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<TurnOffNotificationTaskUseCase>(
      () => TurnOffNotificationTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<UpdateTaskUseCase>(
      () => UpdateTaskUseCase(localRepository: sl.call()));
  //repository
  sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(localDataSource: sl.call()));
  //remote data source
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  //external
}
