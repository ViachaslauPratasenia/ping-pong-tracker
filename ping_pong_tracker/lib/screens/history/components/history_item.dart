import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ping_pong_tracker/models/game.dart';
import 'package:ping_pong_tracker/screens/game/game_controller.dart';
import 'package:ping_pong_tracker/utils/names.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class HistoryItem extends StatelessWidget {
  final Game game;

  const HistoryItem({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('HH:mm dd.MM.yyyy');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            formatter.format(game.time ?? DateTime.now()),
            style: defaultTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  getNames(Team.first, game.users),
                  style: defaultTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${game.firstTeamScore} - ${game.secondTeamScore}',
                  style: defaultTextStyle,
                ),
              ),
              Expanded(
                child: Text(
                  getNames(Team.second, game.users),
                  style: defaultTextStyle,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16),
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
