import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import '../models/models.dart';

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

  // TODO: Add create database code here

}
