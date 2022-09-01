import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/screens/about/about_controller.dart';
import 'package:ping_pong_tracker/utils/conditional_content.dart';
import 'package:ping_pong_tracker/utils/styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = DI.put(AboutController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Об игре'),
      ),
      body: Obx(() {
        return ConditionalContent(
          conditional: !controller.isLoading.value,
          truthyBuilder: () => SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    controller.title.value,
                    style: defaultTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    controller.subtitle.value,
                    textAlign: TextAlign.justify,
                    style: defaultTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          falsyBuilder: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        );
      }),
    );
  }
}
