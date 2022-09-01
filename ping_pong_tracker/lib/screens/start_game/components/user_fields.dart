import 'package:flutter/material.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/screens/start_game/start_game_controller.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class UserFields extends StatelessWidget {
  final int number;

  const UserFields({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.find<StartGameController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          'Игрок ${number + 1}',
          style: defaultTextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: defaultBoxDecoration,
                child: TextField(
                    controller:
                        controller.getDepartmentControllerByIndex(number),
                    decoration: customInputDecoration.copyWith(
                      hintText: 'Отдел',
                    ),
                    readOnly: true,
                    onTap: () => controller.onDeptClicked(number)),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                decoration: defaultBoxDecoration,
                child: TextField(
                    controller: controller.getNameControllerByIndex(number),
                    readOnly: true,
                    decoration: customInputDecoration.copyWith(
                      hintText: 'Имя',
                    ),
                    onTap: () => controller.onNameClicked(number)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
