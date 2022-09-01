import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/models/game.dart';
import 'package:ping_pong_tracker/storage/game_storage.dart';

class HistoryController extends GetxController {
  late GameStorage storage;
  RxList games = <Game>[].obs;

  @override
  void onInit() {
    super.onInit();
    storage = DI.find<GameStorage>();
    games.addAll(storage.getAllGamesList());
  }
}
