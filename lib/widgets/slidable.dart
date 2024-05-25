import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/controllers/task_controller.dart';

class CustomSlidableWidget extends StatelessWidget {
  final int index;
  final Widget child;
  const CustomSlidableWidget({
    required this.index,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                taskController.delete(index);
                taskController.sortedTasks.removeAt(index);
              },
            ),
            children: [
              SlidableAction(
                onPressed: (context) {
                  taskController.sortedTasks.removeAt(index);
                  taskController.delete(index);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (context) {},
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(8)),
                backgroundColor: taskController.isDarktheme
                    ? Colors.white
                    : CustomColors.instaPurple,
                foregroundColor:
                    taskController.isDarktheme ? Colors.black : Colors.white,
                icon: Icons.close,
                label: 'Close',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            dismissible: DismissiblePane(onDismissed: () {
              taskController.delete(index);
              taskController.sortedTasks.removeAt(index);
            }),
            children: [
              SlidableAction(
                onPressed: (context) {},
                borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
                backgroundColor: taskController.isDarktheme
                    ? Colors.white
                    : CustomColors.instaPurple,
                foregroundColor:
                    taskController.isDarktheme ? Colors.black : Colors.white,
                icon: Icons.close,
                label: 'Close',
              ),
              SlidableAction(
                onPressed: (context) {
                  taskController.delete(index);
                  taskController.sortedTasks.removeAt(index);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: child,
        );
      },
    );
  }
}
