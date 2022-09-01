import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/models/user.dart';
import 'package:ping_pong_tracker/storage/user_storage.dart';
import 'package:ping_pong_tracker/utils/uuid.dart';

import '../../di/DI.dart';

class AddPlayerController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();

  void addNewPlayer() {
    var userStorage = DI.find<UserStorage>();
    userStorage.storeUser(
      User(
        id: GUIDGen.generate(),
        name: nameController.text,
        department: deptController.text
      ),
    );
    Get.back();
  }
}
