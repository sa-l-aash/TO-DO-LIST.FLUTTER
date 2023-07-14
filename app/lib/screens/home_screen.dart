//this imports the ui components and themes
import 'package:app/screens/completed.dart';
import 'package:app/screens/favorites.dart';
import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';

//HomeScreen is a subclass of 'StatelessWidget'
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
            const Image(
              image: AssetImage('images/undraw_Add_tasks_re_s5yj.png'),
              width: 400,
            ),
            const Text(''),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const Text('Login/Register'),
            ),
            const Text(''),
            const Text(
              'Tasks show up here after you create them',
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 200, 280, 0),
              child: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 105, 7, 7),
                child: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
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
              icon: const Icon(Icons.check_box, color: Colors.white),
            ),
            label: 'completed',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Favorites()));
              },
              icon: const Icon(Icons.favorite, color: Colors.white),
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
