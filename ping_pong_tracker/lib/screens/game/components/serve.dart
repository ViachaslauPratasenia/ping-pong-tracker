import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/screens/game/game_controller.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class Serve extends StatelessWidget {
  const Serve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.find<GameController>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Obx(() {
            return Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: controller.serve.value == Team.first
                    ? Colors.black
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
        Text(
          '.',
          style: defaultTextStyle.copyWith(
            fontSize: 60,
            color: Colors.transparent,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Obx(() {
            return Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: controller.serve.value == Team.second
                    ? Colors.black
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }
}
