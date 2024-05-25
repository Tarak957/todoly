import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoly/constants/boxes.dart';
import 'package:todoly/controllers/task.dart';

class TaskController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController tasksController = TextEditingController();
  bool isDarktheme = false;
//!Checkbox
  void taskChange(int index) {
    Task task = boxTasks.getAt(index);
    task.taskDone = !task.taskDone;
    boxTasks.putAt(index, task);
    update();
  }

//!Theme
  void themeChange() {
    isDarktheme = !isDarktheme;
    update();
  }

//!Adding details to hive
  void addItems() {
    boxTasks.put(
      'key_${titleController.text}',
      Task(
        title: titleController.text,
        task: tasksController.text,
        taskDone: false,
        dateAndTime: DateFormat("E, d MMM yyyy, HH:mm a")
            .format(DateTime.now())
            .toString(),
      ),
    );
    update();
  }

//!Deleting specific items
  void delete(int index) {
    boxTasks.deleteAt(index);
    update();
  }

//!Clearing all items before adding to hive
  void clearAll() {
    titleController.clear();
    tasksController.clear();
    update();
  }

//!Deleting all items
  void deleteAll() {
    boxTasks.clear();
    update();
  }

  List<Task> sortedTasks = [];
  void sortTasks() {
    sortedTasks = boxTasks.values.toList().cast<Task>();
    sortedTasks.sort((a, b) => a.dateAndTime.compareTo(b.dateAndTime));
    update();
  }
}
