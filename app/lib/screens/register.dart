import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:app/Globals/globals_variables.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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

  Future<void> viewTable() async {
    print(await todoDB.query(userTable));
  }

  Future<void> deleteAll() async {
    print(await todoDB.delete(userTable));
  }

  void _register() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (_nameController.text.isEmpty) {
      mySnackBar('name is field empty', Colors.red);
    } else if (_emailController.text.isEmpty) {
      mySnackBar('Email field is empty', Colors.red);
    } else if (_passwordController.text.isEmpty) {
      mySnackBar('Password field is empty', Colors.red);
    } else if (_confirmPasswordController.text.isEmpty) {
      mySnackBar('Confirm Password field is empty', Colors.red);
    } else if (password != confirmPassword) {
      mySnackBar('Passwords do not match!', Colors.red);
      return;
    } else {
      await todoDB.insert(userTable, {
        'name': name,
        ' email': email,
        ' password': password,
      });

      Navigator.pushReplacement<void, void>(context,
          MaterialPageRoute<void>(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register page',
          style: GoogleFonts.aboreto().copyWith(fontSize: 30),
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
              'Register',
              style: GoogleFonts.aboreto().copyWith(fontSize: 30),
            ),
            const Text(''),
            ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: const Image(
                image: AssetImage('images/undraw_Sign_up_n6im.png'),
                width: 300,
                height: 200,
              ),
            ),
            const Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                controller: _nameController,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  labelText: 'name',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 254),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                controller: _emailController,
                maxLength: 30,
                cursorColor: Colors.blue,
                //this decorates things inside the textfield
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
                const Padding(
                  padding: EdgeInsets.all(6.0),
                ),
                Text(
                  'Must have a min of 8 characters including letters and integers ',
                            style: GoogleFonts.aboreto().copyWith(fontSize: 8,fontWeight: FontWeight.w700),

                ),
              ],
            ),
            const Text(''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text(
                'Register',
                style: GoogleFonts.aboreto().copyWith(fontSize: 25),
              ),
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }

// class CheckboxExample extends StatefulWidget {
//   const CheckboxExample({super.key});

//   @override
//   State<CheckboxExample> createState() => _CheckboxExampleState();
// }

// class _CheckboxExampleState extends State<CheckboxExample> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Colors.blue;
//       }
//       return Colors.blue;
//     }

//     return Checkbox(
//       checkColor: Colors.white,
//       fillColor: MaterialStateProperty.resolveWith(getColor),
//       value: isChecked,
//       onChanged: (bool? value) {
//         setState(() {
//           isChecked = value!;
//         });
//       },
//     );
//   }
// }
}
