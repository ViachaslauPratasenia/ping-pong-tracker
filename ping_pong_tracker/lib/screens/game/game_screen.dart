import 'package:flutter/material.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/models/user.dart';
import 'package:ping_pong_tracker/screens/game/components/logs.dart';
import 'package:ping_pong_tracker/screens/game/components/players.dart';
import 'package:ping_pong_tracker/screens/game/components/score.dart';
import 'package:ping_pong_tracker/screens/game/components/serve.dart';
import 'package:ping_pong_tracker/screens/game/game_controller.dart';

class GameScreen extends StatelessWidget {
  final List<User> players;

  const GameScreen({Key? key, required this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DI.put(GameController(players));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Игра'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Players(
              players: players,
            ),
            const SizedBox(
              height: 16,
            ),
            const Score(),
            const Serve(),
            const Logs(),
          ],
        ),
      ),
    );
  }
}
