import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/note_model.dart';

class SqlHelper {
  final String colId = "id";
  final String colName = "name";
  final String colDate = "date";
  final String colNotes = "notes";
  final String colPosition = "position";
  final String tableNotes = "Notes";
  static Database? _db;
  final int version = 1;
  static final SqlHelper _singleton = SqlHelper.internal();
  SqlHelper.internal();

  factory SqlHelper() {
    return _singleton;
  }

  Future<Database> init() async {
    String directory = getApplicationDocumentsDirectory().toString();
    String path = join(directory, 'demo.db');

    _db = await openDatabase(path, version: version, onCreate: _createDb);
    return _db!;
  }

  Future _createDb(Database db, int version) async {
    String query =
        '''CREATE TABLE $tableNotes ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colDate TEXT, $colNotes TEXT, $colPosition INTEGER)''';

    await db.execute(query);
  }

  Future getNotesFromDb() async {
    _db ??= await init();
    List<Map<String, dynamic>> notesList = await _db!.query(
      tableNotes,
    );

    return notesList;
  }

  Future<int> insertNoteIntoDb(Note note) async {
    int id = await _db!.insert(tableNotes, note.toMap());
    return id;
  }

  Future<int> updateNoteIntoDb(Note note) async {
    int id = await _db!.update(tableNotes, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return id;
  }

  Future<int> deleteNoteFromDb(Note note) async {
    var id = _db!.delete(tableNotes, where: '$colId = ?', whereArgs: [note.id]);
    return id;
  }

  Future close() async => _db!.close();
}
