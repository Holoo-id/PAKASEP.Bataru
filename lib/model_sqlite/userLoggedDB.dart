import 'dart:io';

import 'package:pakasep/model_sqlite/userLogged.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserLoggedDB {

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "UserLoggedDB");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          """
          CREATE TABLE UserLogged (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nik TEXT,
            nama TEXT,
            status TEXT
          )
          """
        );
      }

    );
  }

  Future<int> getLength() async {
    final db = await init();

    int lengthCount = Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM UserLogged"));

    return lengthCount;
  }

  Future<int> insertDB(UserLogged item) async {
    final db = await init();

    return db.insert("UserLogged", item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore
    );
  }

  Future<List<UserLogged>> fetchUser() async{ //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query("UserLogged"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) { //create a list of memos
      return UserLogged(
        nik:  maps[i]['nik'],
        nama:  maps[i]['nama'],
        status: maps[i]['status'],
      );
    });
  }

}