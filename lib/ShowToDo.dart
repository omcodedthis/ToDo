import 'package:flutter/material.dart';
import 'ToDo.dart';

class ShowToDo extends StatelessWidget {
  final ToDo todo;
  final void Function(ToDo todo) swapToDoState; // a method is passed that is tied to the toDo object.
  final void Function(ToDo todo) deleteToDo; // a method is passed that is tied to the toDo object.

  ShowToDo({required this.todo, required this.swapToDoState, required this.deleteToDo}) : super(key: ObjectKey(todo));

  // Strikes through the item's text if it is checked.
  TextStyle? _getTextStyle(bool checked) {
    if (checked) {
      return const TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    }

    return null;
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        swapToDoState(todo);
      },
      leading: Checkbox(
        checkColor: Colors.greenAccent,
        activeColor: Colors.red,
        value: todo.completed,
        onChanged: (value) {
          swapToDoState(todo);
        },
      ),
      title: Row(children: <Widget>[
        Expanded(
          child: Text(todo.name, style: _getTextStyle(todo.completed)),
        ),
        IconButton(
          iconSize: 30,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          alignment: Alignment.centerRight,
          onPressed: () {
            deleteToDo(todo);
          },
        ),
      ]),
    );
  }

}