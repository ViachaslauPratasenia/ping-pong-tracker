import 'package:hive/hive.dart';
import 'package:ping_pong_tracker/models/game.dart';

class GameStorage {
  final _store = Hive.box<Game>("games");

  storeGame(Game game) {
    putOrUpdate(game);
  }

  removeGame(Game game) {
    if (getAllGamesList().contains(game)) {
      _store.deleteAt(getAllGamesList().indexOf(game));
    }
  }

  List<Game> getAllGamesList() {
    return _store.values.toList();
  }

  Game? getGameById(String id) {
    return getAllGamesList().firstWhere((game) {
      return game.id == id;
    });
  }

  storeAllGames(List<Game> gameList) {
    List<Game> oldGameList = getAllGamesList();

    if (gameList.isEmpty) {
      for (var game in oldGameList) {
        removeGame(game);
      }

      return;
    }

    for (var game in oldGameList) {
      if (!gameList.contains(game)) {
        try {
          gameList.where((element) => element.id == game.id);

          removeGame(game);
        } catch (exception) {
          removeGame(game);
        }
      }
    }
    for (var game in gameList) {
      storeGame(game);
    }
  }

  Future<void> putOrUpdate(Game game) {
    var indexOfGame = -1;

    for (int index = 0; index < _store.values.length; index++) {
      if (_store.getAt(index)?.id == game.id) {
        indexOfGame = index;
        break;
      }
    }

    if (indexOfGame == -1) {
      return _store.add(game);
    } else {
      return _store.putAt(indexOfGame, game);
    }
  }
}
