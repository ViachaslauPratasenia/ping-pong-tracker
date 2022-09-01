import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:ping_pong_tracker/models/user.dart';

part 'game.g.dart';

@HiveType(typeId: 1)
class Game extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<User> users;
  @HiveField(2)
  final DateTime? time;
  @HiveField(3)
  final int firstTeamScore;
  @HiveField(4)
  final int secondTeamScore;

  const Game({
    this.id = '',
    this.users = const [],
    this.time,
    this.firstTeamScore = 0,
    this.secondTeamScore = 0,
  });

  @override
  List<Object?> get props => [id, users, firstTeamScore, secondTeamScore];
}
