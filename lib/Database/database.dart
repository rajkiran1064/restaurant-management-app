import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class myDatabase {
 static Database ? database;
 myDatabase.init();

 Future<Database> get getDb async {
  if (database != null) return database!;

  database = await initDB('zhawarna.db');
  return database!;
}

Future<Database> initDB (String filePath) async {
   final dbPath = await getDatabasesPath();
   print(dbPath.runtimeType);
   print(dbPath);
   final path = join(dbPath, filePath);
   database = await openDatabase(path, version: 1, onCreate: onCreate);
   print(database);
   return database!;
}

Future onCreate(Database db, int version) async {
  await db.execute('')
}

}