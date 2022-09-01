import 'package:hive/hive.dart';
import 'package:ping_pong_tracker/models/user.dart';

class UserStorage {
  final _store = Hive.box<User>("users");

  storeUser(User user) {
    putOrUpdate(user);
  }

  removeUser(User user) {
    if (getAllUsersList().contains(user)) {
      _store.deleteAt(getAllUsersList().indexOf(user));
    }
  }

  List<User> getAllUsersList() {
    return _store.values.toList();
  }

  User? getUserById(String id) {
    return getAllUsersList().firstWhere((user) {
      return user.id == id;
    });
  }

  User? getUserByNameAndDepartment(String name, String department) {
    return getAllUsersList().firstWhere((user) {
      return user.name == name && user.department == department;
    });
  }

  storeAllUsers(List<User> userList) {
    List<User> oldUserList = getAllUsersList();

    if (userList.isEmpty) {
      for (var user in oldUserList) {
        removeUser(user);
      }

      return;
    }

    for (var user in oldUserList) {
      if (!userList.contains(user)) {
        try {
          userList.where((element) => element.id == user.id);

          removeUser(user);
        } catch (exception) {
          removeUser(user);
        }
      }
    }
    for (var user in userList) {
      storeUser(user);
    }
  }

  Future<void> putOrUpdate(User user) {
    var indexOfUser = -1;

    for (int index = 0; index < _store.values.length; index++) {
      if (_store.getAt(index)?.id == user.id) {
        indexOfUser = index;
        break;
      }
    }

    if (indexOfUser == -1) {
      return _store.add(user);
    } else {
      return _store.putAt(indexOfUser, user);
    }
  }

  List<String> getAllDept() {
    List<String> deptList = getAllUsersList().map((e) => e.department).toList();
    return deptList.toSet().toList();
  }

  List<String> getAllNamesByDept(String? dept) {
    if (dept == null || dept.isEmpty) {
      return getAllUsersList().map((e) => e.name).toList();
    }

    return getAllUsersList()
        .where((element) => element.department == dept)
        .toList()
        .map((e) => e.name)
        .toList();
  }
}
