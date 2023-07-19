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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Tasks'),
          backgroundColor: const Color.fromARGB(255, 105, 7, 7),
          automaticallyImplyLeading: false,
        ),
        body: const SingleChildScrollView());
  }
}
