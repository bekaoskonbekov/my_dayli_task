import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TaskEntity extends Equatable {
  String id;
   String title;
   int colorIndex;
   String time;
   bool isComplateTask;
   bool isNotification;
   String taskType;

  TaskEntity(
    
      {
       required this.id,
       required this.title,
     required this.colorIndex,
     required this.time,
     required this.isComplateTask,
     required this.isNotification,
     required this.taskType});

  @override
  List<Object?> get props =>
      [id, time, title, colorIndex, isComplateTask, isNotification, taskType];
}
