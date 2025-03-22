import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:to_do/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  int get totaltasks => _tasks.length;
  void AddTask(String name) {
    _tasks.add(Task(false, name));
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggle();
    notifyListeners();
  }
}
