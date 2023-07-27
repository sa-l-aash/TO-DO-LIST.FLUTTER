import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/Globals/globals_variables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


//This is the entry point to the app
void main() async {
  
  runApp(const MyApp());
//this obtains the applications document directory and constructs a path
//to a sqlite database with the name 'todo.db'
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String pathToDB = "${documentsDirectory.path}/todo.db";

  todoDB = await openDatabase(pathToDB, version: 2,
      onCreate: (Database db, int version) async {
    await db.execute(
      //here a table with its value stored in a global variable named
      //'$userTable' that stores users info
      //NB: i have also stored the table column names in global variables
      //which are the words starting with a dollar sign
      'CREATE TABLE $userTable ( $userTBName TEXT, $userTBEmail VARCHAR, $userTBPassword VARCHAR)',
    );
  },
      //here another table is created
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tasksTable($tasksTBId INTEGER PRIMARY KEY , $tasksTBTitle TEXT, $tasksTBDescription VARCHAR , $tasksTBIsDone INTEGER)');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //'materialApp' is a widget which represents the root of this app
    return MaterialApp(
      //removes the debug banner
      debugShowCheckedModeBanner: false,
      //this is the title of the app
      title: 'To do list flutter app',
      //here ive set the theme to be in dark mode
      theme: ThemeData.dark(),
      
      
      //here the HomeScreen page is what will be rendered first when the app is opened
      home: const HomeScreen(),
    );
  }
}
