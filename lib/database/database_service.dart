import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB('eduref.db');
    return _db!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE departments(dept_id INTEGER PRIMARY KEY AUTOINCREMENT, dept_name TEXT NOT NULL);''',
    );

    await db.execute('''
      CREATE TABLE semesters(
        sem_id INTEGER PRIMARY KEY AUTOINCREMENT,
        semester_number INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE subjects(
        sub_id INTEGER PRIMARY KEY AUTOINCREMENT,
        dept_id INTEGER,
        sem_id INTEGER,
        sub_name TEXT,
        FOREIGN KEY(dept_id) REFERENCES departments(dept_id),
        FOREIGN KEY(sem_id) REFERENCES semesters(sem_id)
      );
    ''');

    await db.execute('''
      CREATE TABLE books(
        book_id INTEGER PRIMARY KEY AUTOINCREMENT,
        sub_id INTEGER,
        book_title TEXT,
        author TEXT,
        pdf_link TEXT,
        FOREIGN KEY(sub_id) REFERENCES subjects(sub_id)
      );
    ''');
  }

  Future<void> initData() async {
    final db = await database;
    final existing = await db.query('departments');
    if(existing.isNotEmpty) return;

    final batch = db.batch();

    batch.insert('departments',
      {'dept_id': 1, 'dept_name': 'B.Tech CSE'}
    );

    batch.insert('semesters',
      {'sem_id': 1, 'semester_number': 1}
    );

    batch.insert('subjects',
      {'sub_id': 1, 'dept_id': 1, 'sem_id': 1, 'sub_name': 'C Programming'}
    );

    batch.insert('books',
        {
        'book_id': 1,
        'sub_id': 1,
        'book_title': 'DSA Made Easy',
        'author': 'Narasimha',
        'pdf_link': 'dsa.pdf'
        }
    );
    await batch.commit(noResult: true);
  }
}
