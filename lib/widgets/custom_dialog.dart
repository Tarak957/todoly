import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/controllers/task_controller.dart';
import 'package:todoly/widgets/custom_textformfield.dart';

class CustomDialog extends StatelessWidget {
  final int? index;
  final bool? isAddTask;
  final String title;
  const CustomDialog(
      {this.index, this.isAddTask = false, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: taskController.isDarktheme
                    ? Colors.black
                    : CustomColors.splashScreenBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: isAddTask!
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextformfield(
                      length: 20,
                      controller: taskController.titleController,
                      label: 'Title',
                    ),
                    const SizedBox(height: 16),
                    CustomTextformfield(
                      controller: taskController.tasksController,
                      label: 'Task',
                    )
                  ],
                )
              : SizedBox(),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.only(bottom: 16),
          actions: [
            RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(100, 40)),
              onPressed: () {
                if (isAddTask! == true) {
                  String title = taskController.titleController.text.trim();
                  String task = taskController.tasksController.text.trim();
                  if (title.isNotEmpty && task.isNotEmpty) {
                    taskController.addItems();
                    taskController.sortTasks();
                    taskController.clearAll();
                    Navigator.pop(context);
                  } else {
                    Get.snackbar(
                      colorText: taskController.isDarktheme
                          ? Colors.black
                          : CustomColors.splashScreenBackground,
                      duration: const Duration(seconds: 1),
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      backgroundColor: Colors.white,
                      "All fields are mandatory!!",
                      '',
                      messageText: Container(),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                    );
                  }
                } else {
                  if (title == 'Permanently delete all ?') {
                    taskController.deleteAll();
                    taskController.sortedTasks.clear();
                  } else {
                    taskController.delete(index!);
                    taskController.sortedTasks.removeAt(index!);
                  }
                  Navigator.pop(context);
                }
              },
              fillColor: taskController.isDarktheme
                  ? Colors.black
                  : CustomColors.splashScreenBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  isAddTask! ? 'ADD' : 'YES',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            RawMaterialButton(
              constraints: BoxConstraints.tight(const Size(100, 40)),
              onPressed: () {
                taskController.clearAll();
                Navigator.pop(context);
              },
              fillColor: taskController.isDarktheme
                  ? Colors.black
                  : CustomColors.splashScreenBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'NO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
