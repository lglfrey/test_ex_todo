import 'package:flutter/material.dart';
import 'package:todo_ex/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTask;

  AddTaskScreen({required this.addTask});

  @override
  Widget build(BuildContext context) {
    String title = '';
    String description = '';

    return Scaffold(
      appBar: AppBar(title: Text('Добавить задачу')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Название'),
              onChanged: (value) => title = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Описание'),
              onChanged: (value) => description = value,
            ),
            ElevatedButton(
              onPressed: () {
                addTask(Task(id: DateTime.now().toString(), title: title, description: description, isCompleted: false));
                Navigator.pop(context); // Возвращение к предыдущему экрану после добавления
              },
              child: Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}
