import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes5.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  // UPGRADE DATABASE TABLES
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async{
    if (oldVersion < newVersion) {
      // you can execute drop table and create table
      db.execute("ALTER TABLE $tableNotes ADD COLUMN ${NoteFields.projectName} TEXT;");
    }
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const integerType = 'INTEGER';
    const doubleType = 'DOUBLE';
    const stringType = 'TEXT';

    await db.execute('''
      CREATE TABLE $tableNotes (
        ${NoteFields.id} $idType,
        ${NoteFields.projectName} $stringType,
        ${NoteFields.totalCostForCreationAndImplementing} $integerType,
        ${NoteFields.algorithmCreatingCost} $doubleType,
        ${NoteFields.salary} $integerType,
        ${NoteFields.timeToCreateAlgorithm} $doubleType,
        ${NoteFields.insuranceInPercents} $doubleType,
        ${NoteFields.insuranceCost} $doubleType,
        ${NoteFields.programCreatingCost} $doubleType,
        ${NoteFields.costOfMachineTime} $doubleType,
        ${NoteFields.hour} $integerType,
        ${NoteFields.day} $integerType,
        ${NoteFields.costPerHour} $integerType,
        ${NoteFields.costForWritingAndCorrecting} $doubleType,
        ${NoteFields.timeForFix} $doubleType,
        ${NoteFields.programmerSalary} $integerType,
        
        ${NoteFields.costOfMachineTimeHours} $integerType,
        ${NoteFields.depreciationPerMonth} $doubleType,
        ${NoteFields.electricityConsumedPerMonth} $doubleType,
        ${NoteFields.maintenanceCostsPerMonth} $doubleType,
        ${NoteFields.workingDayPerMonth} $integerType,
        ${NoteFields.hourlyWorkingDayRate} $integerType,
        ${NoteFields.initialPrice} $integerType,
        ${NoteFields.annualDepreciationPercentage} $doubleType,
        ${NoteFields.requiredPower} $doubleType,
        ${NoteFields.operatingTime} $doubleType,
        ${NoteFields.electricityTariff} $doubleType,
        ${NoteFields.numberOfComputers} $integerType,
        ${NoteFields.programmerSalary2} $integerType,

        ${NoteFields.technicalEquipmentCosts} $integerType,
        ${NoteFields.quantityOfComputers} $integerType,
        ${NoteFields.costOfOneComputer} $integerType,
        ${NoteFields.quantityOfPrinters} $integerType,
        ${NoteFields.costOfOnePrinter} $integerType,
        
        ${NoteFields.costOfImplementingProgram} $integerType,
        ${NoteFields.workingDayPerMonth2} $integerType,
        
        ${NoteFields.profitabilityStandard} $doubleType,
        ${NoteFields.profit} $doubleType,
        ${NoteFields.projectPrice} $doubleType,
        ${NoteFields.programPrice} $integerType                
      )
    ''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    final id = await db.insert(tableNotes, note.toJson());

    return note.copy(id: id);
  }

  Future<void> deleteDatabase(String path) =>
      databaseFactory.deleteDatabase(path);

  Future<bool> databaseExists(String path) =>
      databaseFactory.databaseExists(path);

  Future dropIfExists() async {
    final db = await instance.database;
    int i = await db.rawDelete('DROP TABLE IF EXISTS $tableNotes');
    print('removed: $i notes');
  }

  Future deleteAll() async {
    final db = await instance.database;
    await db.rawDelete('DELETE FROM $tableNotes');
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    var db = await instance.database;
    const orderBy = '${NoteFields.id} ASC';

    try {
      final result = await db.query(tableNotes, orderBy: orderBy);

      return result.map((json) => Note.fromJson(json)).toList();
    } on DatabaseException catch (_, e) {
      print('DatabaseException!!!: \n$e');
      db = await _initDB('notes.db');
      final result = await db.query(tableNotes, orderBy: orderBy);

      return result.map((json) => Note.fromJson(json)).toList();
    }
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> showAllTables() async {
    final db = await instance.database;
    final tables = db.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
    List<Map<String, Object?>> list = await tables;
    for (Map<String, Object?> map in list) {
      map.forEach((k, v) => print('$k : $v \n'));
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
