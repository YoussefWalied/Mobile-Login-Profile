import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'Studentss.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE students(id INTEGER PRIMARY KEY,Name TEXT,StudId TEXT UNIQUE,Email TEXT,Password TEXT,Level TEXT,Gender TEXT,image TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertToDatabase(
      {required String name,
      required String id,
      required String email,
      required String level,
      required String gender,
      required String password,
      required String img}) async {
    await _database?.transaction((txn) async {
      try {
        int rowsAffected = await txn.rawInsert(
            'INSERT INTO students(Name,StudId,email,Level,Gender,Password,image) VALUES("$name","$id","$email","$level","$gender","$password","$img")');
        print('$rowsAffected row(s) inserted successfully');
      } catch (error) {
        print('Error when inserting into the database: $error');
      }
    });
  }

  Future<dynamic> login({required String id, required String password}) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query('students',
        where: 'StudId = ? AND password = ?', whereArgs: [id, password]);

    if (result.isNotEmpty) {
      return [true, result.first];
    } else {
      return [false];
    }
  }

  Future<bool> getID({required String id}) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'students',
      where: 'StudId = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  insertImage({required String img}) async {
    await _database?.transaction((txn) async {
      txn.rawInsert('INSERT INTO students(image) VALUES("$img")').then((value) {
        print('$value Inserted successfully');
      }).catchError((error) {
        print('Error when inserting database ${error.toString()}');
      });
      return null;
    });
  }

  Future<void> update(
      {required int id,
      required String name,
      required String email,
      required String password,
      required String gender,
      required String level,
      required String studid,
      required String img,

    }) async {
    await _database?.update(
      'students',
      {
        'Name': name,
        'Email': email,
        'Password': password,
        'Gender': gender,
        'Level': level,
        'StudId': studid,
        'image': img,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
