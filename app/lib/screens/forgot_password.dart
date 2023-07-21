//this imports the ui components and themes
// import 'package:app/screens/home_screen.dart';
import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot password'),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(''),
            const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 28),
            ),
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
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Row(
              children: [
                Padding(padding: EdgeInsets.all(6.0)),
                Text(
                  'Must have a min of 8 characters including letters and integers',
                  style: TextStyle(
                      fontSize: 10, color: Color.fromARGB(221, 255, 255, 255)),
                ),
              ],
            ),
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const TasksPage()));
                      const snackBar = SnackBar(
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.blue,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 635),
                        content: Text('Login Successful'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text('Login'),
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
