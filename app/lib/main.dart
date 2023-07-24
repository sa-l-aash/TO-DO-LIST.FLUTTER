//this is very important
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:app/Globals/Globals.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

//this is the main method
void main() async {
  runApp(const MyApp());

  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String pathToDB = "${documentsDirectory.path}/todo.db";

  todoDB = await openDatabase(
    pathToDB,
    version: 2,
    onCreate: (Database db, int version) async{
      await db.execute(
        'CREATE TABLE $userTable (name TEXT, email VARCHAR, password VARCHAR)',
      );
    },
    onUpgrade: (Database db, int oldVersion, int newVersion)async{
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT, description VARCHAR , isDone INTEGER)');
    }
  );
  //its a function that runs everything on the target device
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
      home: const HomeScreen(),
    );
  }
}
