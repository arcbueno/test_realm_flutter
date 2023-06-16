import 'package:realm/realm.dart';
import 'package:test_realm/models/task/task.dart';

class TaskDb {
  late final Configuration config;
  late final Realm realm;

  TaskDb() {
    config = Configuration.local([Task.schema]);
    realm = Realm(config);
  }

  Task add(Task task) {
    var taskCreated = realm.write<Task>(() {
      realm.add(task);
      return task;
    });
    return taskCreated;
  }

  List<Task> getAll() {
    return realm.all<Task>().toList();
  }
}
