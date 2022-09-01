import '../models/user.dart';
import '../screens/game/game_controller.dart';

String getNames(Team team, List<User> players) {
  if(players.length == 2) {
    return team == Team.first ? players[0].name : players[1].name;
  } else {
    if(team == Team.first) {
      return '${players[0].name}\n${players[1].name}';
    }
    return '${players[2].name}\n${players[3].name}';
  }
}