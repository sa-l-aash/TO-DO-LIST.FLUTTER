import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  // bool passwordMatch(){
  //   if(passwordController.text == passCheckController.text) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
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
           borderRadius: BorderRadius.circular(10),
              child: const Image(
              image: AssetImage('images/undraw_Sign_up_n6im.png'),
              width: 300,
              height: 200,
            ),
            ),
            
            const Text(''),
              const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                // controller: userNameController,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 254),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                // controller: emailController,
                maxLength: 30,
                cursorColor: Colors.blue,
                //this decorates things inside the textfield
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                // controller: passwordController,
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
                Padding(
                  padding: EdgeInsets.all(6.0),
                ),
                Text(
                  'Must have a min of 8 characters including letters and integers ',
                  style: TextStyle(fontSize: 10, color: Color.fromARGB(221, 255, 255, 255)),
                ),
              ],
            ),
            const Text(''),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: TextField(
                // controller: passCheckController,
                obscureText: true,
                maxLength: 30,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Text(''),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     CheckboxExample(),
            //     Text('Do you want to be remembered?',
            //         style: TextStyle(fontWeight: FontWeight.w500)),
            //   ],
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
                const snackBar = SnackBar(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 487),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.blue,
                  content: Text('registration completed'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text(
                'Register',
              ),
            ),
            const Text(''),
            // ElevatedButton(
            //   onPressed: insertIntoDB,
            //   style: elevatedButtonsStyle,
            //   child: const Text('Register'),
            // )
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
