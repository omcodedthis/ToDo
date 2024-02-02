import 'ToDo.dart';
import 'ToDoRecords.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  // Database init.
  await Hive.initFlutter();

  // Registers the TypeAdapter for the ToDo Type.
  Hive.registerAdapter(ToDoAdapter());
  await Hive.openBox("todos");

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of the application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const ToDoRecords(title: 'Your ToDo'),
    );
  }
}
