import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:test_realm/models/task/task.dart';
import 'package:test_realm/repositories/task_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSyncing = false;
  bool isLoading = false;
  bool isWriting = false;
  late final TaskRepository _repository;
  List<Task> allTasks = <Task>[];

  @override
  void initState() {
    _repository = TaskRepository();
    _getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realm Test'),
        actions: [
          if (isSyncing)
            const CircularProgressIndicator()
          else
            IconButton(
              icon: const Icon(Icons.sync),
              onPressed: () async {
                setState(() {
                  setState(() {
                    isWriting = false;
                    isLoading = false;
                    isSyncing = true;
                  });
                });
                var result = await _repository.sync();
                setState(() {
                  setState(() {
                    isWriting = false;
                    isLoading = false;
                    isSyncing = false;
                  });
                });
                if (!result.success) {
                  print(result.error);
                }
              },
            )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Minha lista de tarefas',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: allTasks.length,
                  itemBuilder: (context, index) {
                    var item = allTasks[index];
                    return ListTile(
                      tileColor: item.done ? Colors.green.shade200 : null,
                      title: Text(item.title),
                    );
                  },
                ),
                if (!isWriting)
                  ListTile(
                    leading: const Icon(Icons.add),
                    onTap: () {
                      setState(() {
                        setState(() {
                          isWriting = true;
                          isLoading = false;
                          isSyncing = false;
                        });
                      });
                    },
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onFieldSubmitted: (String value) {
                        setState(() {
                          isWriting = false;
                          isLoading = true;
                          isSyncing = false;
                        });
                        var newTask = Task(ObjectId(), value);
                        _repository.addTask(newTask);
                        setState(() {
                          isWriting = false;
                          isLoading = false;
                          isSyncing = false;
                        });
                        _getTasks();
                      },
                    ),
                  ),
              ],
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _getTasks() {
    var result = _repository.getAll();
    if (!result.success) {
      allTasks = [];
      print(result.error);
    } else {
      allTasks = result.value ?? [];
    }
    setState(() {});
  }
}
