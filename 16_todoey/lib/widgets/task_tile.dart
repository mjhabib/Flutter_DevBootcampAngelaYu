import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  // global state approach, which not only can have access to this 'TaskTile' but other children like 'Checkboxes' too:
  bool isChecked = false;

  void checkboxCallback(value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          'This is a task!',
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: TaskCheckbox(
            checkboxState: isChecked, toggleCheckboxState: checkboxCallback));
  }
}

// this class is the child of a 'StatefulWidget' that's why we need to mark it as 'Stateless' and can't have any 'setState()' in it
class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final void Function(bool?)? toggleCheckboxState;

  const TaskCheckbox(
      {super.key,
      required this.checkboxState,
      required this.toggleCheckboxState});

  // local state approach, which only can have access to this 'Checkbox' not its parents like 'TaskTiles':
  // bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
      // local state approach:
      // onChanged: (value) {
      // setState(() {
      //   isChecked = value;
      // });
      // };
    );
  }
}
