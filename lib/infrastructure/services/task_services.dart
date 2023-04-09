import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/infrastructure/model/task_model.dart';

class TaskServices {
  /// Create task
  Future createTask(TaskModel taskModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("task").doc();
    return await docRef.set(taskModel.toJson(docRef.id));
  }

  /// fetch all task
  Stream<List<TaskModel>> allTasks() {
    return FirebaseFirestore.instance.collection("task").snapshots().map(
        (event) =>
            event.docs.map((a) => TaskModel.fromJson(a.data())).toList());
  }

  /// fetch all pending task
  Stream<List<TaskModel>> pendingTasks() {
    return FirebaseFirestore.instance
        .collection("task")
        .where("isCompleted", isEqualTo: false)
        .snapshots()
        .map((event) =>
            event.docs.map((a) => TaskModel.fromJson(a.data())).toList());
  }

  /// fetch all completed task
  Stream<List<TaskModel>> completedTasks() {
    return FirebaseFirestore.instance
        .collection("task")
        .where("isCompleted", isEqualTo: true)
        .snapshots()
        .map((event) =>
            event.docs.map((a) => TaskModel.fromJson(a.data())).toList());
  }

  ///Stream Today Tasks
  Stream<List<TaskModel>> streamTodayTasks() {
    return FirebaseFirestore.instance
        .collection('task')
        .where('dateTime', isEqualTo: Timestamp.now())
        .snapshots()
        .map((docsList) =>
            docsList.docs.map((e) => TaskModel.fromJson(e.data())).toList());
  }

  ///Mark Tasks As Complete
  Future markTaskAsComplete(String docID) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(docID)
        .update({'isCompleted': true});
  } ///Delete Task
  Future deleteTask(String docID) async {
    return await FirebaseFirestore.instance
        .collection('task')
        .doc(docID).delete();
  }
}
