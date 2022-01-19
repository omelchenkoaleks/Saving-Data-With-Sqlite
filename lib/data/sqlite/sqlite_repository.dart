import 'dart:async';
// Include helper class, models and repository interface.
import '../repository.dart';
import 'database_helper.dart';
import '../models/models.dart';

// Create a new class named SqliteRepository that extends Repository.
class SqliteRepository extends Repository {
  // Add a dbHelper field, which is just a single instance of DatabaseHelper.
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Recipe>> findAllRecipes() {
    return dbHelper.findAllRecipes();
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() {
    return dbHelper.watchAllRecipes();
  }

  @override
  Stream<List<Ingredient>> watchAllIngredients() {
    return dbHelper.watchAllIngredients();
  }

  @override
  Future<Recipe> findRecipeById(int id) {
    return dbHelper.findRecipeById(id);
  }

  @override
  Future<List<Ingredient>> findAllIngredients() {
    return dbHelper.findAllIngredients();
  }

  @override
  Future<List<Ingredient>> findRecipeIngredients(int id) {
    return dbHelper.findRecipeIngredients(id);
  }

// TODO: Add recipe insert here

}
