import 'package:app/screens/favorites.dart';
// import 'package:app/screens/home_screen.dart';
import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const Text(''),
          const Text(
            'You have completed the following tasks',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const Text(''),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage('images/undraw_Completed_03xt.png'),
              width: 300,
              height: 300,
            ),
          ),
          const Text(''),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.check_box, color: Colors.blue),
                labelText: 'Task 1',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ))),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const TasksPage()));
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
