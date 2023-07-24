import 'package:sqflite/sqflite.dart';

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
