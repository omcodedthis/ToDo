import 'package:hive_flutter/hive_flutter.dart';
import 'ToDo.dart';

class ToDoDatabase {
  // List that stores all ToDo information.
  List<ToDo> toDoList = <ToDo>[];

  // Box reference.
  final box = Hive.box('todos');

  // Initializes the database with an empty list (for first time usage only).
  void createAndInitDatabase() {
    toDoList = [];
  }

  // Gets the stored list data. Used in ToDoRecords.dart initState().
  void loadData() {
    toDoList = box.get("TODOLIST").cast<ToDo>();
  }

  // Adds the ToDo to the database.
  void addToDo(ToDo todo) {
    toDoList.add(todo);
  }

  // Removes the ToDo to the database.
  void removeToDo(ToDo todo) {
    toDoList.removeWhere((element) => element.id == todo.id);
    print("Successful .removeToDo() occurred.");
  }

  // Updates the Database. Used after each addition or removal.
  void updateDB() {
    box.put("TODOLIST", toDoList);
  }
}
