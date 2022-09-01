import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/models/game.dart';
import 'package:ping_pong_tracker/models/user.dart';
import 'package:ping_pong_tracker/screens/main/main_screen.dart';
import 'package:ping_pong_tracker/storage/game_storage.dart';
import 'package:ping_pong_tracker/utils/uuid.dart';

enum Team { first, second }

class GameController extends GetxController {
  final List<User> users;

  GameController(this.users);

  var log = <String>[].obs;

  RxInt counter = 0.obs;
  var serve = Team.first.obs;

  RxInt firstScore = 0.obs;
  RxInt secondScore = 0.obs;

  late GameStorage storage;

  @override
  void onInit() {
    super.onInit();
    storage = DI.find<GameStorage>();
  }

  void onTeamClicked(Team team) {
    if (team == Team.first) {
      firstScore.value++;
    }
    if (team == Team.second) {
      secondScore.value++;
    }
    counter.value++;
    log.add('${firstScore.value} - ${secondScore.value}');
    checkGameOver();
    checkServe();
  }

  void checkGameOver() {
    if ((firstScore.value == 11 && secondScore.value < 10) ||
        (secondScore.value == 11 && firstScore.value < 10)) {
      showGameOver();
      return;
    }

    if (firstScore.value >= 10 && secondScore.value >= 10) {
      if ((firstScore.value - secondScore.value).abs() == 2) {
        showGameOver();
        return;
      }
    }
  }

  void showGameOver() {
    storage.storeGame(Game(
      id: GUIDGen.generate(),
      users: users,
      time: DateTime.now(),
      firstTeamScore: firstScore.value,
      secondTeamScore: secondScore.value,
    ));

    if (Get.context != null) {
      showCupertinoDialog(
        context: Get.context!,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Игра окончена'),
            content: Text('Счет ${log.last}'),
            actions: [
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () {
                  Get.offAll(const MainScreen());
                },
              ),
            ],
          );
        },
      );
    }
  }

  void checkServe() {
    if (counter.value % 2 == 0) {
      changeServe();
    }
  }

  void changeServe() {
    if (serve.value == Team.first) {
      serve.value = Team.second;
      return;
    }
    serve.value = Team.first;
  }
}
