import 'dart:io';
import 'package:basic_ecommerce_sqflite/model/product_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static const _databaseName = "ecommerceDB.db";
  static const _dbVersion = 1;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(dataDirectory.path, _databaseName);
    return await openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _onCreateTable,
      onUpgrade: _onUpgradeTable,
    );
  }

  _onCreateTable(Database db, int version) async {
    String sql = '''
      CREATE TABLE ${ProductModel.tableName} 
      (${ProductModel.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${ProductModel.colProductName} STRING,
      ${ProductModel.colProductDesc} STRING,
      ${ProductModel.colProductPrice} STRING,
      ${ProductModel.colProductPic} STRING
      )''';

    await db.execute(sql);
  }

  _onUpgradeTable(Database db, oldVersion, newVersion) {
    if (oldVersion > newVersion) {
      //
    }
  }

  // Fetch Data
  Future<List<Map<String, dynamic>>> fetchData(String table) async {
    Database db = await database;
    return await db.query(table);
  }

  // Insert Data
  Future<int> insertData(String table, ProductModel productModel) async {
    Database db = await database;
    return await db.insert(table, productModel.toJson());
  }

  // Update Data
  Future<int> updateData(String table, ProductModel productModel) async {
    Database db = await database;
    return await db.update(table, productModel.toJson(),
        where: '${ProductModel.colId}=?', whereArgs: [productModel.id]);
  }

  // Delete Data
  Future<int> deleteData(String table, ProductModel productModel) async {
    Database db = await database;
    return await db.delete(table,
        where: '${ProductModel.colId}=?', whereArgs: [productModel.id]);
  }
}
