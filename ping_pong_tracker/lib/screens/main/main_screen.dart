import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/screens/about/about_screen.dart';
import 'package:ping_pong_tracker/screens/history/history_screen.dart';
import 'package:ping_pong_tracker/screens/start_game/start_game_screen.dart';
import 'package:ping_pong_tracker/utils/custom_button.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Senla app'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () => Get.to(() => const StartGameScreen()),
                text: 'Начать игру',
                textSize: 20,
                textColor: Colors.white,
                containerColor: Colors.blue,
                borderColor: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                onPressed: () => Get.to(() => const HistoryScreen()),
                text: 'История игр',
                textSize: 20,
                textColor: Colors.white,
                containerColor: Colors.blue,
                borderColor: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                style: defaultTextButtonStyle,
                onPressed: () => Get.to(() => const AboutScreen()),
                child: const Text('Об игре'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
