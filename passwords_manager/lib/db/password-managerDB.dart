// Import necessary packages for database operations
import 'package:sqflite/sqflite.dart'; // Sqflite package for database operations
import 'package:path/path.dart'; // Path package to construct database file paths

// Class to manage SQLite database operations
class SqlDB {
  static Database? _db; // Private static variable to hold the database instance

  // Getter method to access the database instance asynchronously
  Future<Database?> get db async {
    if (_db == null) {
      // If database is not initialized, call initialDB() to create/open it
      _db = await initialDB();
      return _db;
    } else {
      // If database is already initialized, return the existing instance
      return _db;
    }
  }

  // Method to initialize and open the database
  initialDB() async {
    String databasepath = await getDatabasesPath(); // Get default database path
    String path = join(
      databasepath,
      'onepass.db',
    ); // Set the database file name and location

    // Open the database and execute onCreate or onUpgrade if needed
    Database db = await openDatabase(
      path,
      onCreate: _onCreate, // Called when database is created for the first time
      version: 1, // Database version (used for upgrades)
      onUpgrade: _onUpgrade, // Called when database version is changed
    );

    return db; // Return the database instance
  }

  // Method called when the database version is upgraded
  _onUpgrade(Database db, int oldVersion, int newVersion) async {
  }

  // Method called when the database is created for the first time
  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "user" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
    "username" TEXT NOT NULL, 
    "password" TEXT NOT NULL,
    "generatedPass" INTEGER DEFAULT 0
  );
''');

    await db.execute('''
  CREATE TABLE "accounts" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "date" TEXT NOT NULL, 
    "password" TEXT NOT NULL
  );
''');
  }

  // Method to retrieve data using a raw SQL query
  getData(String sql) async {
    Database? mydb = await db;
    // Get database instance
    List<Map<String, dynamic>> response = await mydb!.rawQuery(
      sql,
    ); // Execute SELECT query

    return response; // Return fetched data as a list of maps
  }

  // Method to insert data into the database
  Future<int> insertData(String table, Map<String, dynamic> data) async {
    Database? mydb = await db;
    return await mydb!.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to update existing data in the database
  Future<int> updateData(
    String table,
    Map<String, dynamic> data,
    String whereClause,
    List<dynamic> whereArgs,
  ) async {
    Database? mydb = await db;
    return await mydb!.update(
      table,
      data,
      where: whereClause,
      whereArgs: whereArgs,
      conflictAlgorithm: ConflictAlgorithm.replace, // Prevents conflicts
    );
  }

  // Method to delete data from the database
  deleteData(String sql) async {
    Database? mydb = await db; // Get database instance
    int response = await mydb!.rawDelete(sql);
    // Execute DELETE query
    return response; // Return the number of affected rows
  }

  Future<int> getAccountsCount() async {
    Database? mydb = await db; // Access the database instance
    final result = await mydb!.rawQuery(
      'SELECT COUNT(*) as count FROM accounts',
    );
    return Sqflite.firstIntValue(result) ?? 0; // Return the count or 0 if null
  }

  Future<int> getGeneratedCount() async {
    Database? mydb = await db; // Access the database instance
    final result = await mydb!.rawQuery(
      'SELECT generatedPass FROM user ORDER BY id DESC LIMIT 1;',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> incrementGeneratedCount() async {
    Database? mydb = await db; // Access the database instance

    // Get the latest user
    final result = await mydb!.rawQuery(
      'SELECT id, generatedPass FROM user ORDER BY id DESC LIMIT 1;',
    );

    if (result.isEmpty) {
      return 0;
    }

    int currentId = result.first['id'] as int;
    int currentGeneratedPass = result.first['generatedPass'] as int? ?? 0;

    // Increment the value
    currentGeneratedPass++;

    await mydb.rawUpdate('UPDATE user SET generatedPass = ? WHERE id = ?', [
      currentGeneratedPass,
      currentId,
    ]);

    return currentGeneratedPass;
  }

  Future<bool> isTableEmpty(String tableName) async {
    // Access the database instance
    Database? mydb = await db;

    // Query the database to check if the table is empty
    final result = await mydb!.rawQuery('SELECT COUNT(*) FROM $tableName;');

    // If the result is greater than 0, the table is not empty
    int count = Sqflite.firstIntValue(result) ?? 0;

    return count == 0;
  }
}

final SqlDB db = SqlDB();
