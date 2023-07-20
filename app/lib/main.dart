//this is very important
import 'package:app/screens/tasks_page.dart';
import 'package:flutter/material.dart';
//importing home_screen
import 'package:app/screens/home_screen.dart';
import 'package:flutter/services.dart';

//this is the main method
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  //its a function that runs everything on the target device
  runApp(const MyApp());
}

//this is the main widget class of this application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //'materialApp' is a widget which represents the root of this app
    return MaterialApp(
      //removes the debug banner
      debugShowCheckedModeBanner: false,
      title: 'To do list flutter app',
      theme: ThemeData.dark(),
      //       brightness: Brightness.light,
      //       //primarySwatch: Colors.blue,
      //       visualDensity: VisualDensity.adaptivePlatformDensity),
      //   darkTheme: ThemeData(brightness: Brightness.dark),

      //   themeMode: ThemeMode.system,
      home: const TasksPage(),
    );
  }
}
