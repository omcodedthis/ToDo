import 'dart:async';
import 'package:flutter/widgets.dart';
import 'ToDo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class ToDoDatabase {

  late final database;

  ToDoDatabase() {
    setUpDatabase();
  }

  Future<void> setUpDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
        join(await getDatabasesPath(), 'todo_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
    'CREATE TABLE todos(id INTEGER PRIMARY KEY, name TEXT, completed BOOLEAN)',
    );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
    );
  }
  // Define a function that inserts dogs into the database
  Future<void> insertToDo(ToDo todo) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the todos from the todos table.
  Future<List<ToDo>> todos() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('todos');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return ToDo(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        completed: maps[i]['completed'] as bool,
      );
    });
  }

  Future<void> updateToDo(ToDo todo) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'todos',
      todo.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteToDo(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}