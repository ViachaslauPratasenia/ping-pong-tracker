import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String department;

  const User({
    this.id = '',
    this.name = '',
    this.department = '',
  });

  @override
  List<Object?> get props => [id, name, department];
}
