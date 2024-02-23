import 'package:hive/hive.dart';
part 'ToDo.g.dart';

@HiveType(typeId : 1)
class ToDo {
  @HiveField(0)
  String name;
  @HiveField(1)
  int id;
  @HiveField(2)
  bool completed;
  @HiveField(3)
  String date;

  ToDo({
    required this.name,
    required this.id,
    required this.completed,
    required this.date});
}
