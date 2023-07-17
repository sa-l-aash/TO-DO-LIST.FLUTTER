import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

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

  Future<Database> _dataBase() async {
    return await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(
          'CREATE TABLE Users (name TEXT, email VARCHAR, password VARCHAR)',
        );
      },
    );
  }

  void _register() async {
    final db = await _dataBase();
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 635),
          backgroundColor: Colors.blue,
          content: Text('Password do not match '),
        ),
      );
      return;
    } else {
      await db.insert('Users', {
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
        title: const Text('Register page'),
        backgroundColor: const Color.fromARGB(255, 105, 7, 7),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(''),
            const Text(
              'Register',
              style: TextStyle(fontSize: 28),
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
                    //color: Color.fromARGB(255, 254, 254, 254),
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
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(6.0),
                ),
                Text(
                  'Must have a min of 8 characters including letters and integers ',
                  style: TextStyle(
                      fontSize: 10, color: Color.fromARGB(221, 255, 255, 255)),
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
              onPressed: () {
                _register();
              },
              child: const Text(
                'Register',
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
