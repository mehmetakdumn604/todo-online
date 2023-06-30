import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_online/model/task_model.dart';

class LocalDbManager {
  static final LocalDbManager _instance = LocalDbManager._internal();
  static LocalDbManager get instance => _instance;
  LocalDbManager._internal();

  String tasksDb = 'tasks';
  late Box tasksBox;
  Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    tasksBox = await Hive.openBox(tasksDb);
    
  }

  List get tasks {
    try {
      List tasksss = tasksBox.get(tasksDb) ?? [];
      return tasksss;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  void addTask(TaskModel taskModel) async {
    List tempTasks = LocalDbManager._instance.tasks;
    tempTasks=[taskModel, ...tempTasks];
       tasks.sort((a, b) {
      if (a.isCompleted && !b.isCompleted) {
        return 1;
      } else if (!a.isCompleted && b.isCompleted) {
        return -1;
      } else {
        return 0;
      }
    });
    await tasksBox.put(tasksDb, tempTasks);
  }

  void updateTask(TaskModel updatedTask) async {
    final index = tasks.indexWhere((task) {
      bool taskEqual = task.id == updatedTask.id;
       return taskEqual;
    });
    if (index != -1) {
      tasks[index] = updatedTask;
         tasks.sort((a, b) {
      if (a.isCompleted && !b.isCompleted) {
        return 1;
      } else if (!a.isCompleted && b.isCompleted) {
        return -1;
      } else {
        return 0;
      }
    });
      await tasksBox.put(tasksDb, tasks);
    } 
  }
}
