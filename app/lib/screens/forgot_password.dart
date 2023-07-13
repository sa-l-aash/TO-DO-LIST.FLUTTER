//this imports the ui components and themes
import 'package:app/screens/home_screen.dart';
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
            const Image(
              image: AssetImage('images/undraw_Forgot_password_re_hxwm.png'),
              width: 200,
              height: 200,
            ),
            const Text(''),
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
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
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
                  style: TextStyle(fontSize: 10, color: Colors.black87),
                ),
              ],
            ),
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
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
