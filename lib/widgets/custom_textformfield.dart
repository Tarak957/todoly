import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/controllers/task_controller.dart';

class CustomTextformfield extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final int? length;
  const CustomTextformfield(
      {required this.controller, required this.label, this.length, super.key});

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return TextFormField(
          inputFormatters: [LengthLimitingTextInputFormatter(widget.length)],
          controller: widget.controller,
          style: TextStyle(
              color: taskController.isDarktheme
                  ? Colors.black
                  : CustomColors.splashScreenBackground),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: taskController.isDarktheme
                  ? Colors.black
                  : CustomColors.splashScreenBackground,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 2,
                color: taskController.isDarktheme
                    ? Colors.black
                    : CustomColors.splashScreenBackground,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 2,
                color: taskController.isDarktheme
                    ? Colors.black
                    : CustomColors.splashScreenBackground,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 2,
                color: taskController.isDarktheme
                    ? Colors.black
                    : CustomColors.splashScreenBackground,
              ),
            ),
          ),
        );
      },
    );
  }
}
