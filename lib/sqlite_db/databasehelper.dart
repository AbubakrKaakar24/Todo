import 'package:sqflite/sqflite.dart';
class DatabaseHelper{
  static const String _dbName='todo.db';
  static const int _version=1;
  static Future<void> createTable(Database database)async{
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");

  }
  static Future<Database> db() async{
    return openDatabase(
      _dbName,
      version: _version,
      onCreate: (Database database, int version){
        return createTable(database);
      }
    );
  }
  static Future<int> createItems(String? title)async{
     final db= await DatabaseHelper.db();
     final data={'title': title};
     final id= await db.insert('items', data,conflictAlgorithm: ConflictAlgorithm.replace);
     return id;
  }
  static Future<List<Map<String,dynamic>>> getItems()async{
    final db=await DatabaseHelper.db();
    return await db.query('items', orderBy: 'id');
  }
  static Future<int> updateItems(int id, String title)async{
    final db=await DatabaseHelper.db();
    final data={'title':title};
    return await db.update('items', data,where: 'id= ?',whereArgs: [id]);
  }
  static Future<void> deleteItem(int id)async{
    final db=await DatabaseHelper.db();
   await db.delete('items',where: 'id= ?',whereArgs: [id]);
  }
}