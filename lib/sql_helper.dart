import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS stocks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fruit TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        price INTEGER NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'delivery.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createStock(
      String fruit, int quantity, int price, String date) async {
    final db = await SQLHelper.db();

    final data = {
      'fruit': fruit,
      'quantity': quantity,
      'price': price,
      'date': date
    };
    final id = await db.insert('stocks', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
}
