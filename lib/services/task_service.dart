import 'dart:developer';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_online/model/task_model.dart';

class TaskService {
  static final TaskService _instance = TaskService._internal();
  static TaskService get instance => _instance;
  TaskService._internal() {
    //_db = FirebaseFirestore.instance;
  }

  // late FirebaseFirestore _db;

  Future<List<TaskModel>?> getTasks() async {
    try {
      // return await _db
      //     .collection(CollectionFields.tasks.name)
      //     .withConverter(
      //         fromFirestore: (DocumentSnapshot<Map<String, dynamic>> element, snapshotOptions) =>
      //             TaskModel.fromJson(element.id, element.data()!),
      //         toFirestore: (TaskModel task, snap) => task.toJson())
      //     .orderBy("isFinished", descending: false)
      //     .orderBy("createdDate", descending: true)
      //     .get()
      //     .then((value) => value.docs.map((e) => e.data()).toList());
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<TaskModel?> addTask(TaskModel task) async {
    try {
      // return await _db
      //     .collection(CollectionFields.tasks.name)
      //     .add(task.toJson())
      //     .then((value) => task.copyWith(id: value.id));
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  void updateTask(TaskModel taskModel) async {
    try {
      // await _db
      //     .collection(CollectionFields.tasks.name)
      //     .doc(taskModel.id)
      //     .update(taskModel.toJson());
    } catch (e) {
      log(e.toString());
    }
  }
}

enum CollectionFields { tasks, users }
