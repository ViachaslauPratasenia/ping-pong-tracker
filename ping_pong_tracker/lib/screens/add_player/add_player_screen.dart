import 'package:flutter/material.dart';
import 'package:ping_pong_tracker/screens/add_player/add_player_controller.dart';

import '../../di/DI.dart';
import '../../utils/custom_button.dart';
import '../../utils/styles.dart';

class AddPlayerScreen extends StatelessWidget {
  const AddPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddPlayerController controller = DI.put(AddPlayerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить игрока'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Как зовут нового игрока?',
                style: defaultTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: defaultBoxDecoration,
                child: TextField(
                  controller: controller.nameController,
                  decoration: customInputDecoration.copyWith(
                    hintText: 'Имя',
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'В каком отделе он работает?',
                style: defaultTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: defaultBoxDecoration,
                child: TextField(
                  controller: controller.deptController,
                  decoration: customInputDecoration.copyWith(
                    hintText: 'Отдел',
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: controller.addNewPlayer,
                text: 'Добавить',
                textSize: 20,
                textColor: Colors.white,
                containerColor: Colors.blue,
                borderColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
