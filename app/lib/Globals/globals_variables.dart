import 'package:sqflite/sqflite.dart';

//this page stores global variables to be used by various pages/screens
late Database todoDB;
String userTable = 'Users';
String userTBName = 'Name';
String userTBEmail = 'email';
String userTBPassword = 'password';
String tasksTable = 'tasks';
String tasksTBId = 'id';
String tasksTBTitle = 'title';
String tasksTBDescription = 'description';
String tasksTBIsDone = 'isDone';

int myloginid = 0;


