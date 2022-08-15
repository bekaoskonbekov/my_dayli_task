import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_task/features/domain/entities/task_entity.dart';
import 'package:my_daily_task/features/domain/usecases/add_task_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/delete_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/get_all_task.dart';
import 'package:my_daily_task/features/domain/usecases/get_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/init_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/open_database_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/turn_off_notification_usecase.dart';
import 'package:my_daily_task/features/domain/usecases/update_usecase.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final AddTaskUseCase addTaskUseCase;
  final InitNotificationUceCase initNotificationUceCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final GetAllTaskUseCase getAllTaskUseCase;
  final GetNotificationTaskUseCase getNotificationTaskUseCase;
  final OpenDatabaseTaskUseCase openDatabaseTaskUseCase;
  final TurnOffNotificationTaskUseCase turnOffNotificationTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  TaskCubit({
    required this.initNotificationUceCase,
    required this.addTaskUseCase,
    required this.deleteTaskUseCase,
    required this.getAllTaskUseCase,
    required this.getNotificationTaskUseCase,
    required this.openDatabaseTaskUseCase,
    required this.turnOffNotificationTaskUseCase,
    required this.updateTaskUseCase,
  }) : super(TaskInitialState());

  Future<void> addNewTask({required TaskEntity task}) async {
    try {
      await initNotificationUceCase.call();
    } catch (_) {}
  }

  Future<void> initNotification({TaskEntity}) async {
    try {
      await initNotification.call();
    } catch (_) {}
  }

  Future<void> deleteTask({required TaskEntity task}) async {
    try {
      await deleteTaskUseCase.call(task);
    } catch (_) {}
  }

  Future<void> getAllTask() async {
    emit(TaskLoadingState());
    try {
      final taskData = await getAllTaskUseCase.call();
      emit(TaskLoadedState(taskData: taskData));
    } catch (_) {
      emit(TaskFailureState());
    }
  }

  Future<void> openDatabase({TaskEntity}) async {
    try {
      await openDatabaseTaskUseCase.call();
    } catch (_) {}
  }

  Future<void> GetNotification({required TaskEntity task}) async {
    try {
      await getNotificationTaskUseCase.call(task);
    } catch (_) {}
  }

  Future<void> TurnOffNotification({required TaskEntity task}) async {
    try {
      await turnOffNotificationTaskUseCase.call(task);
    } catch (_) {}
  }

  Future<void> UpdateTask({required TaskEntity task}) async {
    try {
      await updateTaskUseCase.call(task);
    } catch (_) {}
  }
}
