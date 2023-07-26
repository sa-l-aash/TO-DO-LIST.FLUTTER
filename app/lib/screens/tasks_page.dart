import 'package:app/Globals/globals_variables.dart';
import 'package:app/screens/completed.dart';
import 'package:app/screens/favorites.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
//This page allows a user to create,delete, update a task and displays them on the screen
//it also stores the tasks in the database

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

  Future<int> getId() async {
    final result =
        await todoDB.rawQuery('SELECT MAX(id) as id FROM $tasksTable');

    int myid;
    //this assigns the first task with the id of 1 if the id is not equal to null
    if (result.single['id'] == null) {
      myid = 1;
    } else {
      //then if the id 1 already exists the next tasks will be given the previous id number +1
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
  //this function saves tasks to the table tasks
  void saveTaskToDB() async {
    final task =
        Task(id: await getId(), title: title, description: description);

    tasks.add(task);

    //this method saves tasks to the database

    await todoDB.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    //Fluttertoast works the same way as the snackbar
    Fluttertoast.showToast(msg: 'Task Added Successfully');
  }

//this function basically shows the items present in the task table when it is called
  Future<void> viewTaskDB() async {
    print(await todoDB.query('$tasksTable'));
  }

//this function prompts a task dialog that allows a user to give the tasks a title and description
//this alert dialog also has a save and cancel buttons to do just that
  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        //AlertDialogs display above another page
        return AlertDialog(
            title: Text(
              'Add Task',
              style: GoogleFonts.aboreto()
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //one textfield to hold the title
                TextField(
                  onChanged: (value) => title = value,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    hintStyle: GoogleFonts.aboreto()
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                //another textfield to hold the description
                TextField(
                  onChanged: (value) => description = value,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintStyle: GoogleFonts.aboreto()
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
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
                child: Text(
                  'Save ',
                  style: GoogleFonts.aboreto()
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.aboreto()
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              )
            ]);
      },
    );
  }

//this function deletes a specific task with a specific index
  Future<void> _deleteItem(int index) async {
    int taskIdTODelete = tasks[index].id;
    setState(() {
      tasks.removeAt(index);
    });
//it also deletes the task from the database
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

            trailing: Wrap(spacing: 12, children: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
              //this is an icon button that runs the '_deleteItem' function when pressed
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _deleteItem(index);
                },
              )
            ]),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Tasks',
          style: GoogleFonts.aboreto()
              .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        //this prevents the user from going to the previous page
        automaticallyImplyLeading: false,
      ),
      body: _buildList(),
      //this is a button that runs the function 'showAddTaskDialog'
      //when the icons.add icon button is pressed
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        child: const Icon(
          Icons.add,
        ),
      ), //this aligns the icon to the center of the screen and makes it a float
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //This is the bottom navigation bar with three icon buttons
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              //when pressed it navigates to the HomeScreen
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
            //this routes to the completed page
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
                //this routes to the favorites page
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
