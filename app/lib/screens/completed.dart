import 'package:app/screens/favorites.dart';
import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});
  @override
  Widget build(BuildContext context) {
    //scaffold is the size of your device
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Completed Tasks',
          style: GoogleFonts.aboreto().copyWith(fontSize: 25,fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        automaticallyImplyLeading: false,
      ),
      //this allows its content to be scrolled when it overflows the available space
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(children: <Widget>[
          //this is just an empty text
          const Text(''),
          Text(
            'These are your completed tasks',
          style: GoogleFonts.aboreto().copyWith(fontSize: 20,fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
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
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const TasksPage()));
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
