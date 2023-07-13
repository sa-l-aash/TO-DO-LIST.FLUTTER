import 'package:app/screens/favorites.dart';
import 'package:app/screens/home_screen.dart';
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
    body:const SingleChildScrollView(
      child: Column(

        children: <Widget> [
          Text(''),
          Text('You have completed the following tasks',
          style:TextStyle(fontWeight: FontWeight.bold)
        ),
        Text(''),
        Padding(padding: EdgeInsets.symmetric(horizontal:30),
        child: TextField(
          
          decoration:InputDecoration(
            icon:Icon(Icons.check_box,
            color:Colors.blue),
            labelText: 'Task 1',
            border:OutlineInputBorder(),

          )
        )
        ),
       
        ]
      ),
    ),
     bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        items: <BottomNavigationBarItem>[
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            label: 'Home',
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
