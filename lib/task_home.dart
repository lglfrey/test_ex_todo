import 'package:flutter/material.dart';
import 'package:todo_ex/add_task.dart';
import 'package:todo_ex/task.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;
  final Function toggleCompletion;

  TasksScreen({required this.tasks, required this.toggleCompletion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Все задачи')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
            trailing: Checkbox(
              value: tasks[index].isCompleted,
              onChanged: (bool? value) {
                toggleCompletion(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen(addTask: addTask)),
          );
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
