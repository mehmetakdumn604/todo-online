import 'package:flutter/widgets.dart';
import 'package:todo_online/core/init/caching/local_db_manager.dart';
import 'package:todo_online/model/task_model.dart';
import 'package:todo_online/services/task_service.dart';

class TaskController extends ChangeNotifier {
  static final TaskController _instance = TaskController._internal();
  static TaskController get instance => _instance;
  TaskController._internal();

  TextEditingController taskEditingController = TextEditingController();

  List tasks = [];

  bool isLoading = false;

  Future getTasks({bool fromCache = true}) async {
    if (fromCache) {
      tasks = LocalDbManager.instance.tasks;

      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
      return tasks;
    } else {
      return await TaskService.instance.getTasks().then((value) {
        if (value == null) return [];
        tasks = value;
        notifyListeners();
        return tasks;
      });
    }
  }

  void addTask({bool fromCache = true}) async {
    if (taskEditingController.text.isEmpty) return;

    changeLoadingState();
    TaskModel task = TaskModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: taskEditingController.text,
      createdDate: DateTime.now(),
      completedDate: null,
      isCompleted: false,
    );
    taskEditingController.clear();

    if (fromCache) {
      tasks.add(task);
      notifyListeners();

      LocalDbManager.instance.addTask(task);
    } else {
      TaskModel? addedTask = await TaskService.instance.addTask(task);
      if (addedTask == null) return;

      task = task.copyWith(
        id: addedTask.id,
      );

      tasks.add(task);
    }

    tasks.sort((a, b) => b.createdDate.compareTo(a.createdDate));
    tasks.sort((a, b) {
      if (a.isCompleted && !b.isCompleted) {
        return 1;
      } else if (!a.isCompleted && b.isCompleted) {
        return -1;
      } else {
        return 0;
      }
    });

    changeLoadingState();
  }

  void updateTask(int index, {bool fromCache = true}) {
    TaskModel taskModel = tasks[index];
    taskModel = taskModel.copyWith(isCompleted: !taskModel.isCompleted);
    tasks[index] = taskModel;
    notifyListeners();
    if (fromCache) {
      LocalDbManager.instance.updateTask(taskModel);
    } else {
      TaskService.instance.updateTask(taskModel);
    }
  }

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
