import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/screens/add_player/add_player_screen.dart';
import 'package:ping_pong_tracker/screens/start_game/components/user_fields.dart';
import 'package:ping_pong_tracker/utils/custom_button.dart';
import 'package:ping_pong_tracker/utils/styles.dart';
import 'package:ping_pong_tracker/utils/tabs.dart';

import 'start_game_controller.dart';

class StartGameScreen extends StatelessWidget {
  const StartGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.put(StartGameController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Начать игру'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 140),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Tabs(
                      selectedIndex: 0,
                      children: const ['2 игрока', '4 игрока'],
                      onChanged: (index) =>
                          controller.updatePlayersCount(index ?? 0),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.playersCount.value,
                        itemBuilder: (_, index) {
                          return UserFields(
                            key: ValueKey(index),
                            number: index,
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    onPressed: controller.onStartGameClicked,
                    text: 'Начать игру',
                    textSize: 20,
                    textColor: Colors.white,
                    containerColor: Colors.blue,
                    borderColor: Colors.white,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const AddPlayerScreen());
                    },
                    child: Text(
                      'Добавить игрока',
                      style: defaultTextStyle.copyWith(
                          color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
