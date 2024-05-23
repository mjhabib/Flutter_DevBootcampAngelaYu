import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
  });

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'buy milk'),
    Task(name: 'pickup the books'),
    Task(name: 'have fun!'),
    Task(name: 'new task')
  ];

  void checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          toggleCheckboxState: (value) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks
          .length, // the ListView.builder needs to know how many items to create
    );
  }
}
