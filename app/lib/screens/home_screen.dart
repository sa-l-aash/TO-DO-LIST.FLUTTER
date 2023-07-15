//this imports the ui components and themes
import 'package:app/screens/completed.dart';
import 'package:app/screens/favorites.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/register.dart';
import 'package:flutter/material.dart';

//HomeScreen is a subclass of 'StatelessWidget'
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        automaticallyImplyLeading: false,
      ),
      //'body' specifies the content of the screen
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(''),
            const Text(
              'Hi this is your to do list app',
              //styling a text
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const Text(''),
            const Icon(
              Icons.account_box,
              color: Colors.blue,
            ),
            const Text(''),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage('images/undraw_Add_tasks_re_s5yj.png'),
                width: 400,
              ),
            ),
            const Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Register()));
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
            const Text(''),
            const Text(
              'Tasks show up here after you create them',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 280, 0),
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(Icons.add),
                onPressed: () {
                  addTask('New Task');
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
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
                Navigator.of(context).push(
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
                Navigator.of(context).push(
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
