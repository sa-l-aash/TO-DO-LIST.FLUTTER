import 'package:app/screens/completed.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Tasks'),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        automaticallyImplyLeading: false,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(''),
            Text(
              'These are your favorite tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            Text(''),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  labelText: 'Task 1',
                  border: OutlineInputBorder(),
                ),
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
