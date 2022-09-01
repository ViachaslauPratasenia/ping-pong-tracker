import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ping_pong_tracker/di/DI.dart';
import 'package:ping_pong_tracker/models/about_game.dart';
import 'package:ping_pong_tracker/storage/about_storage.dart';

class AboutController extends GetxController {
  Uri url = Uri.https(
    'en.wikipedia.org',
    '/w/api.php',
    {
      'format': 'json',
      'action': 'query',
      'prop': 'extracts',
      'exlimit': 'max',
      'explaintext': '',
      'exintro': '',
      'titles': 'Table_tennis',
    },
  );

  var title = ''.obs;
  var subtitle = ''.obs;
  var isLoading = true.obs;

  late AboutStorage storage;

  @override
  Future<void> onInit() async {
    super.onInit();
    storage = DI.find<AboutStorage>();
    
    var aboutGame = await storage.getAboutGame('Table tennis');
    if(aboutGame == null) {
      getAboutGameInfo();
    } else {
      title.value = aboutGame.title;
      subtitle.value = aboutGame.subtitle;

      isLoading.value = false;
    }
    
  }
  
  Future<void> getAboutGameInfo() async {
    final response = await http.get(url);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    title.value = decodedResponse['query']['pages']['30589']['title'];
    subtitle.value = decodedResponse['query']['pages']['30589']['extract'];

    await storage.addAboutGame(
      AboutGame(title: title.value, subtitle: subtitle.value),
    );

    isLoading.value = false;
  }
}
