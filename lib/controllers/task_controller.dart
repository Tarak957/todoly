import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/constants/boxes.dart';
import 'package:todoly/controllers/task.dart';

class TaskController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController tasksController = TextEditingController();
  bool isDarktheme = false;
  void taskChange(int index) {
    Task task = boxTasks.getAt(index);
    task.taskDone = !task.taskDone;
    boxTasks.putAt(index, task);
    update();
  }

  void themeChange() {
    isDarktheme = !isDarktheme;
    update();
  }

  void entry() {
    boxTasks.put(
        'key_${titleController.text}',
        Task(
          title: titleController.text,
          task: tasksController.text,
          taskDone: false,
        ));
    update();
  }

  void delete(int index) {
    boxTasks.deleteAt(index);
    update();
  }

  void clearAll() {
    titleController.clear();
    tasksController.clear();
    update();
  }
}
