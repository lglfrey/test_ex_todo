import 'package:flutter/cupertino.dart';
import 'package:todo_ex/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void toggleTaskCompletion(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
    notifyListeners();
  }

  void editTask(String id, String newTitle) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    _tasks[taskIndex].title = newTitle;
    notifyListeners();
  }
}
