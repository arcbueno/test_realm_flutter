import 'package:test_realm/db/task_db.dart';
import 'package:test_realm/models/result/result.dart';
import 'package:test_realm/models/task/task.dart';
import 'package:test_realm/remote/task_remote.dart';

class TaskRepository {
  late final TaskDb _taskDb;
  late final TaskRemote _taskRemote;

  TaskRepository()
      : _taskDb = TaskDb(),
        _taskRemote = TaskRemote();

  Result addTask(Task task) {
    try {
      _taskDb.add(task);
      return Result();
    } catch (e) {
      return Result(error: e.toString());
    }
  }

  Result<List<Task>> getAll() {
    try {
      var result = _taskDb.getAll();
      return Result<List<Task>>(value: result);
    } catch (e) {
      return Result(error: e.toString());
    }
  }

  Future<Result> sync() async {
    try {
      var result = _taskDb.getAll();
      await _taskRemote.addAll(result);
      return Result();
    } catch (e) {
      return Result(error: e.toString());
    }
  }
}
