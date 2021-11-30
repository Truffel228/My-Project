part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedUsersState extends HomeState {
  HomeLoadedUsersState(this.users) : assert(users != null);
  final List<User>? users;
}

class HomeLoadedRecipesState extends HomeState {
  HomeLoadedRecipesState(this.recipes) : assert(recipes != null);
  final List<Recipe>? recipes;
}

class HomeErrorState extends HomeState {}
