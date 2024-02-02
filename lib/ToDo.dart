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

  ToDo({required this.name, required this.id, required this.completed});

  // Convert a ToDo into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'completed': completed,
    };
  }

  // Implement toString to make it easier to see information about
  // each todo when using the print statement.
  @override
  String toString() {
    return 'ToDo{id: $id, name: $name, completed: $completed}';
  }
}
