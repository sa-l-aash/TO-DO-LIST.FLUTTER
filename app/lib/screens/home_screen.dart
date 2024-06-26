//this imports the ui components and themes
import 'package:app/screens/completed.dart';
import 'package:app/screens/favorites.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/register.dart';
import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:path/path.dart';

//HomeScreen is a subclass of 'StatelessWidget'
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String printText(String text) {
    return ('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: GoogleFonts.aboreto()
              .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
        automaticallyImplyLeading: false,
      ),
      //'body' specifies the content of the screen
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(''),
            Text(
              'Hi this is your to do list app',
              //styling a text
              style: GoogleFonts.aboreto()
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const Text(''),
            const Icon(
              Icons.account_box,
              color: Colors.blue,
            ),
            const Text(''),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Hero(
                  tag: 'hero',
                  child: Image(
                    image: AssetImage('images/undraw_Add_tasks_re_s5yj.png'),
                    width: 400,
                  ),
                )),
            const Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.aboreto()
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Register()));
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.aboreto()
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const TasksPage()));
              },
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            label: ('Home'),
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
