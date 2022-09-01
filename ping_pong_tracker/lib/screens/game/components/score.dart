import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/screens/game/game_controller.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.find<GameController>();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Obx(() {
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.onTeamClicked(Team.first),
              child: Text(
                controller.firstScore.value.toString(),
                style: defaultTextStyle.copyWith(fontSize: 60),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }),
        Text(
          ':',
          style: defaultTextStyle.copyWith(fontSize: 60),
          textAlign: TextAlign.center,
        ),
        Obx(() {
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.onTeamClicked(Team.second),
              child: Text(
                controller.secondScore.value.toString(),
                style: defaultTextStyle.copyWith(fontSize: 60),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }),
      ],
    );
  }
}
