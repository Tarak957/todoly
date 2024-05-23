import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/controllers/task_controller.dart';

class CustomDialog extends StatelessWidget {
  final int index;
  const CustomDialog({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(builder: (taskController) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Delete Permanently ?',
            style: TextStyle(
                fontSize: 20,
                color: taskController.isDarktheme
                    ? Colors.black
                    : CustomColors.splashScreenBackground,
                fontWeight: FontWeight.bold),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.only(bottom: 16),
        actions: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(100, 40)),
            onPressed: () {
              taskController.delete(index);
              Navigator.pop(context);
            },
            fillColor: taskController.isDarktheme
                ? Colors.black
                : CustomColors.splashScreenBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'YES',
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
    });
  }
}
