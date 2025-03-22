import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final void Function(bool?)? tickCheckbox;
  final void Function()? removeTask;
  TaskTile(this.isChecked, this.name, this.tickCheckbox, this.removeTask);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: removeTask,
        leading: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            decoration:
                isChecked! ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: tickCheckbox,
        ));
  }
}
