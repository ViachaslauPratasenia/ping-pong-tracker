import 'dart:convert';

AboutGame aboutGameFromJson(String str) {
  final jsonData = json.decode(str);
  return AboutGame.fromMap(jsonData);
}

String aboutGameToJson(AboutGame data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class AboutGame {
  String title;
  String subtitle;

  AboutGame({
    required this.title,
    required this.subtitle,
  });

  factory AboutGame.fromMap(Map<String, dynamic> json) => AboutGame(
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "subtitle": subtitle,
      };
}
