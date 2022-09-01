import 'package:flutter/material.dart';
import 'package:ping_pong_tracker/models/user.dart';
import 'package:ping_pong_tracker/screens/game/game_controller.dart';
import 'package:ping_pong_tracker/utils/names.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class Players extends StatelessWidget {
  final List<User> players;

  const Players({Key? key, required this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            getNames(Team.first, players),
            style: defaultTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            getNames(Team.second, players),
            style: defaultTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}