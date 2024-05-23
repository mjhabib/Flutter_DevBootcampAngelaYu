import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?)? toggleCheckboxState;

  const TaskTile(
      {super.key,
      required this.taskTitle,
      required this.isChecked,
      required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toggleCheckboxState,
      ),
    );
  }
}
