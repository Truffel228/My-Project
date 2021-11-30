import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixareo_test_task/models/recipe_model.dart';
import 'package:pixareo_test_task/models/user_model.dart';
import 'package:pixareo_test_task/repositories/recipes_repository/recipes_repository_interface.dart';
import 'package:pixareo_test_task/repositories/users_repository/users_repository_interface.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({@required this.usersRepository, @required this.recipesRepository})
      : super(HomeInitialState());

  RecipesRepositoryInterface? recipesRepository;
  UsersRepositoryInterface? usersRepository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadRecipesEvent) {
      yield* _loadRecipesToState(event);
    } else if (event is HomeCleanEvent) {
      yield HomeInitialState();
    } else if (event is HomeLoadUsersEvent) {
      yield* _loadUsersToState(event);
    }
  }

  Stream<HomeState> _loadRecipesToState(HomeLoadRecipesEvent event) async* {
    List<Recipe>? recipes = [];

    try {
      yield HomeLoadingState();
      recipes = await recipesRepository?.getRecipes();
      yield HomeLoadedRecipesState(recipes);
    } catch (e) {
      print(e);
      yield HomeErrorState();
    }
  }

  Stream<HomeState> _loadUsersToState(HomeLoadUsersEvent event) async* {
    List<User>? users = [];

    try {
      yield HomeLoadingState();
      users = await usersRepository?.getUsers();
      yield HomeLoadedUsersState(users!);
    } catch (e) {
      print(e);
      yield HomeErrorState();
    }
  }
}
