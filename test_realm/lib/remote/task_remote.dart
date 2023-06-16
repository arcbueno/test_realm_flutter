import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_realm/flavors.dart';
import 'package:test_realm/models/task/task.dart';

class TaskRemote {
  static final String collectionName = '${F.collectionPrefix}-Tasks';
  late final FirebaseFirestore remoteDb;
  TaskRemote() {
    remoteDb = FirebaseFirestore.instance;
  }

  Future<void> add(Task task) async {
    var result = await remoteDb.collection(collectionName).add(task.toJson());
    print('Created task with id: ${result.id}');
  }

  Future<void> addAll(List<Task> tasks) async {
    await remoteDb.collection(collectionName).get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
    for (var element in tasks) {
      await add(element);
    }
  }

  Future<List<Task>> getAll() async {
    List<Task> allTasks = <Task>[];
    var result = await remoteDb.collection(collectionName).get();
    for (var element in result.docs) {
      allTasks.add(taskJsonToRealmObject(element));
    }
    return allTasks;
  }
}
