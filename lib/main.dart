import 'package:flutter/material.dart';
import 'package:todoly/constants/init_controllers.dart';
import 'package:todoly/controllers/task.dart';
import 'package:todoly/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoly/screens/splash_screen.dart';

import 'constants/boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  boxTasks = await Hive.openBox<Task>('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    InitControllers().init();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
      // home: MainScreen(),
    );
  }
}
