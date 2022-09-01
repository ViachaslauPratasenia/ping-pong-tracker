import 'package:get/get.dart';
import 'package:ping_pong_tracker/storage/about_storage.dart';
import 'package:ping_pong_tracker/storage/game_storage.dart';
import 'package:ping_pong_tracker/storage/user_storage.dart';

class DI {
  static initializeInstances() {
    Get.put(UserStorage());
    Get.put(GameStorage());
    Get.put(AboutStorage());
  }

  static T put<T>(T obj, {String? tag}) {
    return Get.put<T>(obj, tag: tag);
  }

  static T find<T>({String? tag}) {
    return Get.find<T>(tag: tag);
  }

  DI._();
}
