import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/models/user.dart';
import 'package:ping_pong_tracker/screens/game/game_screen.dart';
import 'package:ping_pong_tracker/storage/user_storage.dart';

class StartGameController extends GetxController {
  var playersCount = 2.obs;

  List<User> users = List.generate(4, (index) => const User());
  List<String> names = List.generate(4, (index) => '');
  List<String> departments = List.generate(4, (index) => '');

  final List<TextEditingController> _nameControllers =
      List.generate(4, (index) => TextEditingController());
  final List<TextEditingController> _departmentControllers =
      List.generate(4, (index) => TextEditingController());

  late UserStorage storage;

  @override
  void onInit() {
    super.onInit();
    storage = DI.find<UserStorage>();
  }

  void updatePlayersCount(int count) {
    if (count == 0) playersCount.value = 2;
    if (count == 1) playersCount.value = 4;
  }

  void onDeptClicked(int index) {
    var departmentsStorage = storage.getAllDept();

    int initialItem = 0;

    if (departmentsStorage.isNotEmpty) {
      initialItem = departments[index].isNotEmpty
          ? departmentsStorage.indexOf(departments[index])
          : 0;

      departments[index] = departmentsStorage[initialItem];
      _departmentControllers[index].text = departments[index];
    }

    if (Get.context != null) {
      showCupertinoModalPopup(
        context: Get.context!,
        builder: (_) => SizedBox(
          height: 200,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController:
                FixedExtentScrollController(initialItem: initialItem),
            children:
                List<Widget>.generate(departmentsStorage.length, (int index) {
              return Center(
                child: Text(departmentsStorage[index]),
              );
            }),
            onSelectedItemChanged: (value) {
              departments[index] = departmentsStorage[value];
              _departmentControllers[index].text = departments[index];

              if (names[index].isNotEmpty) {
                names[index] = '';
                _nameControllers[index].text = '';
              }
            },
          ),
        ),
      );
    }
  }

  void onNameClicked(int index) {
    var namesStorage = storage.getAllNamesByDept(departments[index]);

    int initialItem = 0;

    if (namesStorage.isNotEmpty) {
      initialItem =
          names[index].isNotEmpty ? namesStorage.indexOf(names[index]) : 0;

      names[index] = namesStorage[initialItem];
      _nameControllers[index].text = names[index];

      setUser(index);
    }

    if (Get.context != null) {
      showCupertinoModalPopup(
        context: Get.context!,
        builder: (_) => SizedBox(
          height: 200,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 30,
            scrollController:
                FixedExtentScrollController(initialItem: initialItem),
            children: List<Widget>.generate(namesStorage.length, (int index) {
              return Center(
                child: Text(namesStorage[index]),
              );
            }),
            onSelectedItemChanged: (value) {
              names[index] = namesStorage[value];
              _nameControllers[index].text = names[index];

              setUser(index);
            },
          ),
        ),
      );
    }
  }

  void onStartGameClicked() {
    if (!isUsersFilled()) {
      Get.snackbar('Ошибка', 'Заполните всех пользователей');
      return;
    }
    Get.to(() => GameScreen(players: users.take(playersCount.value).toList()));
  }

  TextEditingController getNameControllerByIndex(int index) {
    return _nameControllers[index];
  }

  TextEditingController getDepartmentControllerByIndex(int index) {
    return _departmentControllers[index];
  }

  void setUser(int index) {
    User? currentUser =
        storage.getUserByNameAndDepartment(names[index], departments[index]);
    if (currentUser != null) {
      users[index] = currentUser;
    }
  }

  bool isUsersFilled() {
    var list = [...users];
    list.removeWhere((element) => element.id.isEmpty);
    if ((list.length >= 2 && playersCount.value == 2) || list.length == 4) {
      return true;
    } else {
      return false;
    }
  }
}
