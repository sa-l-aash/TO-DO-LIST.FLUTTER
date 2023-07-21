import 'package:app/screens/completed.dart';
import 'package:app/screens/favorites.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:fluttertoast/fluttertoast.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasksFromDB();
  }

  void _loadTasksFromDB() async {
    //loads the tasks from the sqflite and updates the state of the widget
    final database = await openDatabase(
      path.join(await getDatabasesPath(), 'todo.db'),
//if the db is not found then the oncreate is used
      onCreate: (db, version) {
        //isDone is an integer because it is bool so 0 or 1
        db.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT, description VARCHAR , isDone INTEGER)');
      },
      version: 1,
    );
    final List<Map<String, dynamic>> maps = await database.query('tasks');
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

  void saveTaskToDB(Task task) async {
    //this method saves tasks to the database
    final database = await openDatabase(
      path.join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) => {
        db.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT, description VARCHAR , isDone INTEGER)')
      },
      version: 1,
    );
    await database.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    //works the same way as the snackbar
    Fluttertoast.showToast(msg: 'Task Added Successfully');
  }

  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        int id;
        String title = '';
        String description = '';

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
                  final newTask =
                      Task(id: 2, title: title, description: description);
                  setState(() {
                    tasks.add(newTask);
                    Navigator.of(context).pop();
                  });
                },
                child: const Text('Save '),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop,
                child: const Text('Cancel'),
              )
            ]);
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      tasks.removeAt(index);
    });
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
        onPressed: showAddTaskDialog,
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
                color: Colors.grey,
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
              color: const Color.fromARGB(255, 255, 255, 255),
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
