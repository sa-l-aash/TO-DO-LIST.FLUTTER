import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:app/Globals/globals_variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


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


    if (_nameController.text.isEmpty || _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      mySnackBar('Please fill in all fields', Colors.red);
    } else if (password != confirmPassword) {
      mySnackBar('Passwords do not match!', Colors.red);
    } else {
      // Send registration data to the Laravel backend
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/register'),
       
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        // Registration successful, you can navigate to a success page or handle it as needed
        mySnackBar('Registration Successful', Colors.green);

        // Use Navigator to push the login page onto the stack
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(builder: (context) => const LoginScreen()),
        );
      } else {
        // Registration failed, handle the error (e.g., display an error message)
        mySnackBar('Registration Failed', Colors.red);
      }
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
                //this decorates things inside the text field
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

