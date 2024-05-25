import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:todoly/constants/custom_colors.dart';
import 'package:todoly/screens/main_screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Get.off(() => const MainScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.splashScreenBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lotties/todo.json'),
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                "T o d o l y",
                textStyle: const TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 80),
              ),
            ],
            isRepeatingAnimation: true,
            repeatForever: true,
          )
        ],
      ),
    );
  }
}
