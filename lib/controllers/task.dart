import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  Task(
      {required this.title,
      required this.task,
      required this.taskDone,
      required this.dateAndTime});
  @HiveField(0)
  String title;

  @HiveField(1)
  String task;

  @HiveField(2)
  bool taskDone;

  @HiveField(3)
  String dateAndTime;
}
