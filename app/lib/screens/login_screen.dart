// import 'package:app/screens/home_screen.dart';
import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';
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

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    // Retrieves the email and password entered by the user

    List<Map<String, dynamic>> users = await _database.rawQuery(
      "SELECT * FROM Users WHERE email = '$email' AND password = '$password'",
    );

    // Queries the database to find matching user credentials
    if (_emailController.text.isEmpty) {
      const SnackBar(
        content: Text('email is required'),
      );
    } else if (_passwordController.text.isEmpty) {
      const SnackBar(
        content: Text('password is required'),
      );
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const TasksPage()));
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
        padding: const EdgeInsets.symmetric(horizontal: 5),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextFormField(
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    const SnackBar(
                      content: Text('email is needed'),
                      behavior: SnackBarBehavior.floating,
                    );
                  }
                  return null;
                },
              ),
            ),
            const Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextFormField(
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
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
                      _login();
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
