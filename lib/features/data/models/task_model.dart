import 'package:my_daily_task/features/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required String id,
     required String title,
    required int colorIndex,
     required String time,
     required bool isComplateTask,
     required bool isNotification,
     required String taskType,
  }) : super(id: id,
            colorIndex: colorIndex,
            time: time,
            title: title,
            isComplateTask: isComplateTask,
            isNotification: isNotification,
            taskType:taskType)
            ;
  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      id: json['id'],
      colorIndex: json['colorIndex'],
      time: json['time'],
      isComplateTask: json['isComplateTask'],
      isNotification: json['isNotification'],
      taskType: json['taskType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "colorIndex": colorIndex,
      "time": time,
      "isComplateTask": isComplateTask,
      "isNotification": isNotification,
      "taskType": taskType,
    };
  }
}
