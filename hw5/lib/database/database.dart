import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../models/student.dart';

class DBProvider {
  DBProvider._();

  String tableName = 'Students';
  String columnId = 'id';
  String columnName = 'name';

  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    return await _initDB();
  }

  Future<Database> _initDB() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}Student.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database database, int version) async {
    await database.execute(
      'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT)',
    );
  }

  Future<List<Student>> getStudents() async {
    Database db = await database;
    List<Map<String, dynamic>> studentsList =
        await db.query(tableName, columns: [columnId, columnName]);
    return studentsList.map((student) => Student.fromMap(student)).toList();
  }

  Future<void> addStudent(Student student) async {
    Database? db = await database;
    await db.insert(tableName, student.toMap());
  }

  Future<void> deleteStudent(int? id) async {
    Database db = await database;
    await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<void> updateStudent(Student changedStudent) async {
    Database db = await database;
    db.update(tableName, changedStudent.toMap(),
        where: '$columnId = ?', whereArgs: [changedStudent.id]);
  }
}
