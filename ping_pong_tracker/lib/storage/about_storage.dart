import 'dart:io';
import 'package:ping_pong_tracker/models/about_game.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AboutStorage {
  AboutStorage() {
    initDB();
  }

  late Database _database;

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "AboutGame.db");
    _database = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE AboutGame ("
              "title TEXT PRIMARY KEY,"
              "subtitle TEXT"
              ")");
    });
  }

  Future addAboutGame(AboutGame aboutGame) async {
    final db = _database;
    var raw = await db.rawInsert(
        "INSERT Into AboutGame (title,subtitle)"
        " VALUES (?,?)",
        [aboutGame.title, aboutGame.subtitle]);
    return raw;
  }

  Future updateClient(AboutGame aboutGame) async {
    final db = _database;
    var res = await db.update("AboutGame", aboutGame.toMap(),
        where: "title = ?", whereArgs: [aboutGame.title]);
    return res;
  }

  Future<AboutGame?> getAboutGame(String title) async {
    final db = _database;
    var res = await db.query("AboutGame", where: "title = ?", whereArgs: [title]);
    return res.isNotEmpty ? AboutGame.fromMap(res.first) : null;
  }

  Future deleteAboutGame(String title) async {
    final db = _database;
    return db.delete("Client", where: "title = ?", whereArgs: [title]);
  }

  Future deleteAll() async {
    final db = _database;
    db.rawDelete("Delete * from AboutGame");
  }
}
