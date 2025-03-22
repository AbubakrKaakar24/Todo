import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/sqlite_db/databasehelper.dart';
class AddTaskScreen extends StatelessWidget {
  String? newTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
          ),
          TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (value) {
              newTitle = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.blueAccent)),
              onPressed: () async{
                int id=await DatabaseHelper.createItems(newTitle);
                Provider.of<TaskData>(context, listen: false)
                    .AddTask(newTitle!);
                Navigator.pop(context);

              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
