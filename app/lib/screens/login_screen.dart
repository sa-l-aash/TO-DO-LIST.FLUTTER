import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/forgot_password.dart';
import 'package:app/Globals/globals_variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Cleans up resources when the widget is removed from the tree

  void mySnackBar(String myText, Color myBackgroundColor) {
    final snackBar = SnackBar(
      content: Text(
        myText,
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      backgroundColor: myBackgroundColor,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _login() async {
    // Queries the database to find matching user credentials
    if (_emailController.text.isEmpty) {
      mySnackBar('Email field is empty', Colors.red);
    } else if (_passwordController.text.isEmpty) {
      mySnackBar('Password field is empty', Colors.red);
    } else {
      String email = _emailController.text;
      String password = _passwordController.text;
      // Retrieves the email and password entered by the user

      List<Map<String, dynamic>> users = await todoDB.rawQuery(
        "SELECT * FROM Users WHERE email = '$email' AND password = '$password'",
      );

      if (users.isEmpty) {
        Fluttertoast.showToast(msg: 'Login unsuccessful!');
      } else {
        Fluttertoast.showToast(msg: 'Login successful');
        Navigator.pushReplacement<void, void>(context,
            MaterialPageRoute<void>(builder: (context) => const TasksPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Login page',
                  style: GoogleFonts.aboreto().copyWith(fontSize: 25,fontWeight: FontWeight.w700),
),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(''),
             Text(
              'Login',
          style: GoogleFonts.aboreto().copyWith(fontSize: 20,fontWeight: FontWeight.w700),
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
                controller: _emailController,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextFormField(
                controller: _passwordController,
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
              ),
            ),
             Row(
              children: [
                const Padding(padding: EdgeInsets.all(6)),
                Text(
                  'Must have a min of 8 characters including letters and integers',
                            style: GoogleFonts.aboreto().copyWith(fontSize: 8,fontWeight: FontWeight.w700),
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
              child:  Text('Forgot Password ?',
                        style: GoogleFonts.aboreto().copyWith(fontSize: 15,fontWeight: FontWeight.w700),
),
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
                    child:  Text(
                      'Login',
                                style: GoogleFonts.aboreto().copyWith(fontSize: 15,fontWeight: FontWeight.w700),

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
