//this is very important
import 'package:flutter/material.dart';
//importing home_screen
import 'package:app/screens/home_screen.dart';

//this is the main method
void main() {
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
      //reoves the debug banner
      debugShowCheckedModeBanner: false,
      //sets the title of the application
      title: 'To do list flutter app',
      //theme sets the theme data for this app
      //theme: specifies that you're defining the theme data for your application.
//ThemeData( creates an instance of the ThemeData class, which represents the overall theme configuration.
//primarySwatch: is a property of ThemeData that sets the primary color for your application.
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      //the 'home' property sets the initial route of your app
      //to the 'HomeScreen' widget
      //it tells Flutter that the HomeScreen widget should be displayed as
      //the first screen when the app launches.
      home: const HomeScreen(),
    );
  }
}
