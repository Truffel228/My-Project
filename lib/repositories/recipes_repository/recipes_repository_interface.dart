import 'package:pixareo_test_task/models/recipe_model.dart';

abstract class RecipesRepositoryInterface{
  Future<List<Recipe>>? getRecipes();
}