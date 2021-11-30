import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixareo_test_task/repositories/recipes_repository/recipes_repository.dart';
import 'package:pixareo_test_task/repositories/users_repository/users_repository.dart';
import 'package:pixareo_test_task/services/network_service/network_service.dart';
import 'package:pixareo_test_task/services/recipes_service/recipes_service.dart';
import 'package:pixareo_test_task/services/users_service/users_service.dart';
import 'bloc/home/home_bloc.dart';
import 'routes.dart' as routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Передаём единственный объект нашего блока во всё приложение (можно было
    // бы его передать локально на единственный экран, но так как у нас
    // приложение состоит всего из 1 блока я решил добавить его здесь)
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        recipesRepository: RecipesRepository(
          recipesService: RecipesService(
            networkService: NetworkService(),
          ),
        ),
        usersRepository: UsersRepository(
          usersService: UsersService(
            networkService: NetworkService(),
          ),
        ),
      ),
      child: MaterialApp(
        title: 'Pixerio Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: routes.homeScreen,
        routes: routes.getRoutes(),
      ),
    );
  }
}
