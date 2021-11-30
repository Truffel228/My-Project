import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pixareo_test_task/constants.dart';
import 'package:pixareo_test_task/models/recipe_model.dart';
import 'package:pixareo_test_task/services/network_service/network_service_interface.dart';
import 'package:pixareo_test_task/services/recipes_service/recipes_service_interface.dart';

String recipeUrl =
    'https://api.spoonacular.com/recipes/complexSearch?query=pasta&maxFat=25&number=${Constants.numberOfRecipes}&apiKey=${Constants.recipesApiKey}';

class RecipesService implements RecipesServiceInterface {
  RecipesService({@required this.networkService});

  NetworkServiceInterface? networkService;

  @override
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];

    try {
      String response = await networkService!.get(recipeUrl);
      // С сервера мы получаем JSON ответ в поле 'results' содержится список
      // объектов рецетов, его мы и используем
      dynamic decodedResponse = json.decode(response);
      List answer = decodedResponse['results'];
      recipes = answer.map((json) => Recipe.fromJson(json)).toList();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
    return recipes;
  }
}
