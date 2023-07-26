//this imports the ui components and themes
// import 'package:app/screens/home_screen.dart';
import 'package:app/Globals/globals_variables.dart';
import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

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
    } else if (_newPasswordController.text.isEmpty) {
      mySnackBar('New Password field is empty', Colors.red);
    } else if (_confirmNewPasswordController.text.isEmpty) {
      mySnackBar('Confirm New Password field is empty', Colors.red);
    } else if (_newPasswordController != _confirmNewPasswordController) {
      mySnackBar('passwords do not match', Colors.red);
    } else {
      String email = _emailController.text;
      String password = _newPasswordController.text;
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
        title: Text(
          'Forgot password',
          style: GoogleFonts.aboreto().copyWith(fontSize: 25),
        ),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(''),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                image: AssetImage('images/undraw_Forgot_password_re_hxwm.png'),
                width: 300,
                height: 200,
              ),
            ),
            const Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
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
              child: TextField(
                controller: _newPasswordController,
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(6.0)),
                Text(
                  'Must have a min of 8 characters including letters and integers',
          style: GoogleFonts.aboreto().copyWith(fontSize: 8,fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                
                controller: _confirmNewPasswordController,
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child:  Text('Login',
                              style: GoogleFonts.aboreto().copyWith(fontSize: 25,fontWeight: FontWeight.w700),
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
