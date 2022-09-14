import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/configs/constants/db_constants.dart';
import '../../../../core/device/logger_service.dart';

class SQLiteDb {
  final LoggerService _loggerService;
  SQLiteDb(this._loggerService);

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database?> _initDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String dbPath = path.join(
      documentsDirectory.path,
      DbConstants.dbName,
    );
    final db = await openDatabase(
      dbPath,
      version: DbConstants.versionNumber,
      onCreate: _onCreate,
    );
    db.execute("PRAGMA foreign_keys = ON");
    return db;
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    try {
      await db.execute(UserDB.tableCreationQuery);
    } catch (ex, s) {
      _loggerService.logException(ex, s);
    }
  }

  Future<int?> insert<T>(String tableName, T data) async {
    final Database db = await database;
    try {
      // await db.transaction((txn) async {
      return await db.insert(
        tableName,
        jsonDecode(data.toString()) as Map<String, Object?>,
      );
      // });
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return null;
    } finally {
      // db.close();
    }
  }

  Future getSingle<T>(
    String tableName,
    List<String> columns,
    String whereColumn,
    int id,
  ) async {
    final Database db = await database;
    try {
      // await db.transaction((txn) async {
      final List<Map> maps = await db.query(
        tableName,
        columns: columns,
        where: '$whereColumn = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return jsonEncode(maps.first);
      }
      // });
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return null;
    } finally {
      // db.close();
    }
  }

  Future<List<String>?> getAll<T>(
    String tableName,
    List<String> columns, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    final Database db = await database;
    try {
      // await db.transaction((txn) async {
      final List<Map> maps = await db.query(
        tableName,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
      );
      if (maps.isNotEmpty) {
        final List<String> modeledData = <String>[];
        for (final eachRow in maps) {
          modeledData.add(jsonEncode(eachRow));
        }
        return modeledData;
      }
      // });
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return null;
    } finally {
      // db.close();
    }
    return null;
  }

  Future<int> delete<T>(
    String tableName,
    String whereColumn,
    List<dynamic> whereArgs,
  ) async {
    final Database db = await database;
    try {
      // await db.transaction((txn) async {
      return await db.delete(
        tableName,
        where: whereColumn,
        whereArgs: whereArgs,
      );
      // });
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return 0;
    } finally {
      // db.close();
    }
  }

  Future<int> update<T>(
    String tableName,
    String whereColumn,
    List<dynamic> whereArgs,
    T data,
  ) async {
    final Database db = await database;
    try {
      // await db.transaction((txn) async {
      return await db.update(
        tableName,
        jsonDecode(data.toString()) as Map<String, Object?>,
        where: whereColumn,
        whereArgs: whereArgs,
      );
      // });
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return 0;
    } finally {
      // db.close();
    }
  }

  Future<int> clearAll() async {
    final Database db = await database;
    try {
      var count = 0;
      return count += await db.delete(UserDB.tableName);
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return 0;
    } finally {
      // db.close();
    }
  }

  Future<int?> executeQuery(String query) async {
    final Database db = await database;
    try {
      // await db.transaction((txn) async {
      final result = await db.rawQuery(query);
      final data = Sqflite.firstIntValue(result);
      return data;
      // });
    } catch (ex, s) {
      _loggerService.logException(ex, s);
      return null;
    } finally {
      // db.close();
    }
  }
}
