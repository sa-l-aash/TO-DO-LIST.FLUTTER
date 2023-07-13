//this imports the ui components and themes
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/register.dart';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
// import 'dart:io';
import 'package:app/screens/forgot_password.dart';
// import 'package:sqflite/sqflite.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwwordController = TextEditingController();

//   late Database _database;
// }

// @override
// void initState() {
//   super.initState();

// }
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
            const Image(
              image: AssetImage('images/undraw_Mobile_login_re_9ntv.png'),
              width: 300,
              height: 300,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
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
                  style: TextStyle(fontSize: 10, color: Colors.black87),
                ),
              ],
            ),
            const Text(''),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ForgotPassword()));
              },
              child: const Text('Forgot Password ?'),
            ),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                    child: const Text(
                      'Login',
                    ),
                  ),
                ),
                const Text(''),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Register()));
                  },
                  child: const Text(
                    'Register',
                  ),
                ),
              ],
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
