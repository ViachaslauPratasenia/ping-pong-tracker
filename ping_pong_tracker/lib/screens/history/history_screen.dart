import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/screens/history/components/history_item.dart';
import 'package:ping_pong_tracker/screens/history/history_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.put(HistoryController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('История'),
      ),
      body: Obx(() {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.games.length,
          itemBuilder: (_, index) {
            return HistoryItem(game: controller.games[index]);
          },
        );
      }),
    );
  }
}
