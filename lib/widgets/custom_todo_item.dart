import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/controllers/task.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/controllers/task_controller.dart';
import 'package:todoly/widgets/custom_dialog.dart';

class TodoItem extends StatelessWidget {
  final int index;
  const TodoItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (taskController) {
      Task task = taskController.sortedTasks[index];
      return GestureDetector(
        onTap: () => taskController.taskChange(index),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: taskController.isDarktheme
                    ? Colors.white
                    : CustomColors.splashScreenBackground,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          taskController.taskChange(index);
                        },
                        icon: Icon(
                          task.taskDone
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: taskController.isDarktheme
                              ? Colors.white
                              : CustomColors.splashScreenBackground,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.taskDone
                                  ? TextDecoration.lineThrough
                                  : null,
                              decorationColor: taskController.isDarktheme
                                  ? Colors.white
                                  : CustomColors.splashScreenBackground,
                              decorationThickness: 3.5,
                              color: taskController.isDarktheme
                                  ? Colors.white
                                  : CustomColors.splashScreenBackground,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Text(
                              task.task,
                              softWrap: true,
                              style: TextStyle(
                                decoration: task.taskDone
                                    ? TextDecoration.lineThrough
                                    : null,
                                decorationColor: taskController.isDarktheme
                                    ? Colors.white
                                    : CustomColors.splashScreenBackground,
                                decorationThickness: 4,
                                color: taskController.isDarktheme
                                    ? Colors.white
                                    : CustomColors.splashScreenBackground,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              text: 'Date : ',
                              style: TextStyle(
                                color: taskController.isDarktheme
                                    ? Colors.white
                                    : CustomColors.splashScreenBackground,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: task.dateAndTime,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: taskController.isDarktheme
                                        ? Colors.white
                                        : CustomColors.splashScreenBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                              title: 'Delete Permanently ?', index: index);
                        },
                      );
                    },
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: taskController.isDarktheme
                          ? Colors.white
                          : CustomColors.splashScreenBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
