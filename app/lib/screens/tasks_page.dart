import 'package:app/Globals/Globals.dart';
import 'package:app/screens/completed.dart';
import 'package:app/screens/favorites.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/models/task.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' as path;
import 'package:fluttertoast/fluttertoast.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Task> tasks = [];
  List<Task> completed = [];

  @override
  void initState() {
    super.initState();
    _loadTasksFromDB();
  }

  Future<int> getId() async {
    final result =
        await todoDB.rawQuery('SELECT MAX(id) as id FROM $tasksTable');

    int myid;
    if (result.single['id'] == null) {
      myid = 1;
    } else {
      myid = (result.single['id'] as int) + 1;
    }

    return myid;
  }

  void _loadTasksFromDB() async {
    final List<Map<String, dynamic>> maps = await todoDB.query('tasks');
    setState(() {
      tasks = List.generate(
          maps.length,
          (index) => Task(
              id: maps[index]['id'],
              title: maps[index]['title'],
              description: maps[index]['description'],
              isDone: maps[index]['isDone'] == 1));
    });
  }

  String title = '';
  String description = '';
  void saveTaskToDB() async {
    final task =
        Task(id: await getId(), title: title, description: description);

    tasks.add(task);

    //this method saves tasks to the database

    await todoDB.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    //works the same way as the snackbar
    Fluttertoast.showToast(msg: 'Task Added Successfully');
  }

  Future<void> viewTaskDB() async {
    print(await todoDB.query('$tasksTable'));
  }

  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        //this displays above another page
        return AlertDialog(
            title: const Text('Add Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) => title = value,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  onChanged: (value) => description = value,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    saveTaskToDB();
                    Navigator.of(context).pop();
                  });
                },
                child: const Text('Save '),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              )
            ]);
      },
    );
  }

  Future<void> _deleteItem(int index) async {
    int taskIdTODelete = tasks[index].id;
    setState(() {
      tasks.removeAt(index);
    });

    await todoDB.delete('tasks', where: 'id = ?', whereArgs: [taskIdTODelete]);
  }

  Widget _buildList() {
    return ListView.builder(
        //this moves the textfield away from the edge of the screen
        padding: const EdgeInsets.all(10),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          );
          final task = tasks[index];
          return Card(
            child: ListTile(
                leading: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      // completed.add(task);
                      // tasks.remove(task);
                      setState(() {
                        tasks[index].isDone = value!;
                      });
                    }),
                // tileColor: const Color.fromARGB(255, 105, 7, 7),
                title: Text(task.title),
                subtitle: Text(task.description),
                //this makes the textfields bigger or smaller
                dense: false,
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteItem(index);
                  },
                )),
          );
        });
  }

//this is the ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        automaticallyImplyLeading: false,
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: viewTaskDB,
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Completed()));
              },
              icon: const Icon(Icons.check_box),
              color: Colors.grey,
            ),
            label: 'completed',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Favorites()));
              },
              icon: const Icon(Icons.favorite),
              color: Colors.grey,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
