import 'package:flutter/material.dart';
import 'package:todo_ex/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;
  final Function editTask;
  final Function deleteTask;

  EditTaskScreen(
      {required this.task, required this.editTask, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    String title = task.title;
    String description = task.description;

    return Scaffold(
      appBar: AppBar(title: Text('Редактировать задачу')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Название'),
              controller: TextEditingController(text: title),
              onChanged: (value) => title = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Описание'),
              controller: TextEditingController(text: description),
              onChanged: (value) => description = value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    editTask(task.id, title, description);
                    Navigator.pop(
                        context); // Возвращение к предыдущему экрану после редактирования
                  },
                  child: Text('Сохранить'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteTask(task.id);
                    Navigator.pop(
                        context); // Возвращение к предыдущему экрану после удаления
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Удалить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
