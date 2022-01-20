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

  @override
  Future<int> insertRecipe(Recipe recipe) {
    // Return an asynchronous Future.
    return Future(() async {
      // Use your helper to insert the recipe and save the id.
      final id = await dbHelper.insertRecipe(recipe);
      // Set your recipe class’s id to this id.
      recipe.id = id;
      if (recipe.ingredients != null) {
        recipe.ingredients!.forEach((ingredient) {
          // Set each ingredient’s recipeId field to this id.
          ingredient.recipeId = id;
        });
        // Insert all the ingredients.
        insertIngredients(recipe.ingredients!);
      }
      // Return the new id.
      return id;
    });
  }

// TODO: Insert ingredients

}
