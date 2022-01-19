import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import '../models/models.dart';

// This class will handle all the SQLite database operations.
class DatabaseHelper {
  // Constants for the database name and version.
  static const _databaseName = 'MyRecipes.db';
  static const _databaseVersion = 1;

  // Define the names of the tables.
  static const recipeTable = 'Recipe';
  static const ingredientTable = 'Ingredient';
  static const recipeId = 'recipeId';
  static const ingredientId = 'ingredientId';

  // Our sqlbrite database instance. late indicates the variable is non-nullable and that it will be initialized after it’s been declared.
  static late BriteDatabase _streamDatabase;

  // make this a singleton class

  //Make the constructor private and provide a public static instance.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // Define lock, which you’ll use to prevent concurrent access.
  static var lock = Lock();

  // only have a single app-wide reference to the database
  // Private sqflite database instance.
  static Database? _database;

  // SQL code to create the database table
  // Pass an sqflite database db into the method. It will create the tables.
  Future _onCreate(Database db, int version) async {
    // Create recipeTable with the same columns as the model using CREATE TABLE.
    await db.execute('''
        CREATE TABLE $recipeTable (
          $recipeId INTEGER PRIMARY KEY,
          label TEXT,
          image TEXT,
          url TEXT,
          calories REAL,
          totalWeight REAL,
          totalTime REAL
        )
        ''');
    // Create ingredientTable.
    await db.execute('''
        CREATE TABLE $ingredientTable (
          $ingredientId INTEGER PRIMARY KEY,
          $recipeId INTEGER,
          name TEXT,
          weight REAL
        )
        ''');
  }

// TODO: Add code to open database

}
