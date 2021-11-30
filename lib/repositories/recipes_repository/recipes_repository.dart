import 'package:flutter/material.dart';
import 'package:pixareo_test_task/models/recipe_model.dart';
import 'package:pixareo_test_task/repositories/recipes_repository/recipes_repository_interface.dart';

import 'package:pixareo_test_task/services/recipes_service/recipes_service_interface.dart';

class RecipesRepository extends RecipesRepositoryInterface{

  RecipesRepository({@required this.recipesService});

  RecipesServiceInterface? recipesService;

  @override
  Future<List<Recipe>>? getRecipes() => recipesService?.getRecipes();


}