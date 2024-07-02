import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/controllers/task_controller.dart';
import 'package:todoly/widgets/custom_dialog.dart';
import 'package:todoly/widgets/custom_todo_item.dart';
import 'package:todoly/widgets/slidable.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    final taskController = Get.find<TaskController>();
    super.initState();
    taskController.sortTasks();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return Scaffold(
          backgroundColor:
              taskController.isDarktheme ? Colors.black : Colors.white,
          appBar: AppBar(
            centerTitle: false,
            toolbarHeight: 100,
            backgroundColor: taskController.isDarktheme
                ? Colors.grey[900]
                : CustomColors.instaPurple,
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
                },
                icon: Icon(
                  taskController.isDarktheme
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  color: Colors.white,
                ),
              ),
              taskController.sortedTasks.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomDialog(
                              title: 'Permanently delete all ?',
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          body: taskController.sortedTasks.isEmpty
              ? Center(
                  child: Lottie.asset(
                    height: 300,
                    'assets/lotties/empty.json',
                  ),
                )
              : SingleChildScrollView(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemCount: taskController.sortedTasks.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50,
                            child: FadeInAnimation(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CustomSlidableWidget(
                                  index: index,
                                  child: TodoItem(index: index),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: FloatingActionButton.extended(
              backgroundColor: taskController.isDarktheme
                  ? Colors.white
                  : CustomColors.instaPurple,
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
                    return const CustomDialog(
                      title: 'Enter Title and Task',
                      isAddTask: true,
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
