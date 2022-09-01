import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as part_provider;
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/models/game.dart';
import 'package:ping_pong_tracker/models/user.dart';
import 'package:ping_pong_tracker/screens/main/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await part_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(GameAdapter());

  await Hive.openBox<User>("users");
  await Hive.openBox<Game>("games");

  DI.initializeInstances();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Senla',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
