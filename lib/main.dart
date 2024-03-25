import 'package:flutter/material.dart';
import 'package:todo_ex/task.dart';
import 'package:todo_ex/task_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void editTask(String id, String newTitle, String newDescription) {
    setState(() {
      final taskIndex = tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        tasks[taskIndex].title = newTitle;
        tasks[taskIndex].description = newDescription;
      }
    });
  }

  void deleteTask(String id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  void toggleCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(
        tasks: tasks,
        toggleCompletion: toggleCompletion,
      ),
    );
  }
}
