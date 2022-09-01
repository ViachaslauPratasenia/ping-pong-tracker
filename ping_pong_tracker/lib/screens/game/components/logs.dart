import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/screens/game/game_controller.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class Logs extends StatelessWidget {
  const Logs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.find<GameController>();

    return Obx(() {
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.log.length,
          itemBuilder: (_, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    controller.log[index],
                    style: defaultTextStyle.copyWith(wordSpacing: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
