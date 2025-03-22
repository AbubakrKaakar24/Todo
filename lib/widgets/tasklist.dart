import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/widgets/tasktile.dart';
import 'package:to_do/models/task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = taskdata.tasks[index];
          return TaskTile(task.isChecked, task.name, (p0) {
            taskdata.updateTask(task);
          }, () {
            taskdata.removeTask(task);
          });
        },
        itemCount: taskdata.tasks.length,
      ),
    );
  }
}
