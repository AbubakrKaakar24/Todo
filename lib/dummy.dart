import 'package:sqflite/sqflite.dart';
class Dummy {
  static String _dbName='todo.db';
  static int _version=1;
  static Future<void> createTable(Database database)async{
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
    title TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }
  static Future<Database> db()async{
    return await openDatabase(
      _dbName,
      version: _version,
      onCreate: (Database database,int version){
        return createTable(database);
      }
    );
  }
  static Future<int> createItem(String title)async{
    final db=await Dummy.db();
    final data={'title': title};
    return await db.insert('items', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }
  static Future<List<Map<String,dynamic>>> getItems()async{
    final db=await Dummy.db();
    return await db.query('items', orderBy: 'id');
  }
  static Future<int> updateItem(int id, String title)async{
    final db=await Dummy.db();
    final data={'title':title};
    return await db.update('items', data, where: 'id= ?', whereArgs: [id]);
  }
  static Future<void> deleteItem(int id)async{
    final db= await Dummy.db();
    await db.delete('items', where: 'id= ?', whereArgs: [id]);
  }

}