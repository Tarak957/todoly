import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todoly/constants/boxes.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/controllers/task.dart';
import 'package:todoly/controllers/task_controller.dart';
import 'package:todoly/widgets/custom_textformfield.dart';
import 'package:todoly/widgets/custom_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return Scaffold(
          backgroundColor:
              taskController.isDarktheme ? Colors.black : Colors.white,
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: taskController.isDarktheme
                ? Colors.black
                : CustomColors.splashScreenBackground,
            title: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    speed: const Duration(milliseconds: 230),
                    'T o d o l y',
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  taskController.themeChange();
                  taskController.isDarktheme
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                },
                icon: Icon(
                  taskController.isDarktheme
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: boxTasks.length == 0
              ? Lottie.asset('assets/lotties/empty.json')
              : SingleChildScrollView(
                  child: ListView.builder(
                    itemCount: boxTasks.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Task task = boxTasks.getAt(index);
                      return GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(index: index);
                            },
                          );
                        },
                        onTap: () => taskController.taskChange(index),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              : CustomColors
                                                  .splashScreenBackground,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            task.title,
                                            style: TextStyle(
                                              decoration: task.taskDone
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              decorationColor: taskController
                                                      .isDarktheme
                                                  ? Colors.white
                                                  : CustomColors
                                                      .splashScreenBackground,
                                              decorationThickness: 3.5,
                                              color: taskController.isDarktheme
                                                  ? Colors.white
                                                  : CustomColors
                                                      .splashScreenBackground,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.60,
                                            child: Text(
                                              task.task,
                                              softWrap: true,
                                              style: TextStyle(
                                                decoration: task.taskDone
                                                    ? TextDecoration.lineThrough
                                                    : null,
                                                decorationColor: taskController
                                                        .isDarktheme
                                                    ? Colors.white
                                                    : CustomColors
                                                        .splashScreenBackground,
                                                decorationThickness: 4,
                                                color: taskController
                                                        .isDarktheme
                                                    ? Colors.white
                                                    : CustomColors
                                                        .splashScreenBackground,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                              ),
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
                                          return CustomDialog(index: index);
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
                    },
                  ),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: FloatingActionButton.extended(
              backgroundColor: taskController.isDarktheme
                  ? Colors.white
                  : CustomColors.splashScreenBackground,
              label: Text(
                'Add New Task',
                style: TextStyle(
                    fontSize: 20,
                    color: taskController.isDarktheme
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.white,
                      title: Center(
                        child: Text(
                          'Enter Title and Task',
                          style: TextStyle(
                              fontSize: 20,
                              color: taskController.isDarktheme
                                  ? Colors.black
                                  : CustomColors.splashScreenBackground,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      content: Column(
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
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      actionsPadding: const EdgeInsets.only(bottom: 16),
                      actions: [
                        RawMaterialButton(
                          constraints:
                              BoxConstraints.tight(const Size(110, 40)),
                          onPressed: () {
                            if (taskController
                                    .titleController.text.isNotEmpty &&
                                taskController
                                    .tasksController.text.isNotEmpty) {
                              taskController.entry();
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
                          },
                          fillColor: taskController.isDarktheme
                              ? Colors.black
                              : CustomColors.splashScreenBackground,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        RawMaterialButton(
                          constraints:
                              BoxConstraints.tight(const Size(110, 40)),
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
              },
            ),
          ),
        );
      },
    );
  }
}
