import 'package:pixareo_test_task/models/recipe_model.dart';

abstract class RecipesServiceInterface{
  Future<List<Recipe>> getRecipes();
}