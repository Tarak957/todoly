import 'package:get/get.dart';
import 'package:todoly/controllers/task_controller.dart';

class InitControllers {
  void init() {
    Get.put(TaskController());
  }
}
