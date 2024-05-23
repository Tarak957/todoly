import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  Task({required this.title, required this.task, required this.taskDone});
  @HiveField(0)
  String title;

  @HiveField(1)
  String task;

  @HiveField(2)
  bool taskDone;
}
