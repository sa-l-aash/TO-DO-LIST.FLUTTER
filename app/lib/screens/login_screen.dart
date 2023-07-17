import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:app/screens/forgot_password.dart';
import 'package:sqflite/sqflite.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Database _database;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  // Cleans up resources when the widget is removed from the tree

  Future<void> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // Gets the directory for storing the database file

    String path = "${documentsDirectory.path}/users.db";
    // Specifies the path for the database file

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE Users (PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)",
        );
      },
    );
    // Initializes the database and creates a Users table if it doesn't exist
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    // Retrieves the email and password entered by the user

    List<Map<String, dynamic>> users = await _database.rawQuery(
      "SELECT * FROM Users WHERE email = '$email' AND password = '$password'",
    );
    // Queries the database to find matching user credentials

    if (users.isNotEmpty) {
      // Login successful
      // Perform necessary actions (e.g., navigate to another screen)
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
      const snackBar = SnackBar(
        content: Text('Login is Successful!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Login failed
      //perform other functions
      print("Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(''),
            const Text(
              'Login',
              style: TextStyle(fontSize: 28),
            ),
            const Text(''),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('images/undraw_Mobile_login_re_9ntv.png'),
                width: 300,
                height: 300,
              ),
            ),
            const Text(''),
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Row(
              children: [
                Padding(padding: EdgeInsets.all(6)),
                Text(
                  'Must have a min of 8 characters including letters and integers',
                  style: TextStyle(
                      fontSize: 10, color: Color.fromARGB(221, 255, 255, 255)),
                ),
              ],
            ),
            const Text(''),
            const Text(''),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ForgotPassword()));
              },
              child: const Text('Forgot Password ?'),
            ),
            const Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //the padding widget spaces the two widgets
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Colors.black;
                      //this routes to the homescreen
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));

                      const snackBar = SnackBar(
                        duration: Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 635),
                        backgroundColor: Colors.blue,
                        content: Text('Login  successful'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                ),
                const Text(''),
              ],
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
