import 'package:flutter/material.dart';
import 'ToDo.dart';
import 'database.dart';
import 'ShowToDo.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class ToDoRecords extends StatefulWidget {
  const ToDoRecords({super.key, required this.title});
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ToDoRecords> createState() => _ToDoRecordsState();
}


class _ToDoRecordsState extends State<ToDoRecords> {
  final box = Hive.box('todos');
  ToDoDatabase db = ToDoDatabase();
  final TextEditingController _textFieldController = TextEditingController();
  int idCounter = 0;

  // Loads data from the database.
  @override
  void initState() {
    if (box.get("TODOLIST") == null) {
      // First time usage.
      db.createAndInitDatabase();
    } else {
      // Further usages.
      db.loadData();
    }
    super.initState();
  }

  // Adds the ToDo item to the Records.
  void _addToDoItem(String name) {
    setState(() {
      String currentDate = getCurrentDate();
      db.addToDo(ToDo(name: name, id: idCounter, completed: false, date: currentDate));
    });
    db.updateDB();
    _textFieldController.clear();
    idCounter++;
  }

  String getCurrentDate() {
    final now = DateTime.now();
    var formatter = new DateFormat().add_yMd();
    return formatter.format(now);
  }

  // Removes the ToDo item from the Records.
  void _deleteTodo(ToDo todo) {
    setState(() {
      db.removeToDo(todo);
    });
    db.updateDB();
  }

  // Swaps the "completed" value of the ToDo object.
  void _swapToDoCompletedValue(ToDo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
    db.updateDB();
  }


  // Displays the "Add an item." dialog when the '+' button is pressed.
  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add an item:'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Item name'),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _addToDoItem(_textFieldController.text);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _addToDoItem method above.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the ToDoRecords object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        // Creates an iterable from the toDos list which is then shown as a List.
        // For each toDo, it is shown based on the boolean value of its "completed"
        //  instance variable.
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: db.toDoList.map<Widget>((ToDo todo) {
          return ShowToDo(
              todo: todo,
              swapToDoState: _swapToDoCompletedValue,
              deleteToDo: _deleteTodo
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'Add an item.',
        child: const Icon(Icons.add),
      ),
    );
  }
}
