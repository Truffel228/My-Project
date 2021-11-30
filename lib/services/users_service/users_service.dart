import 'dart:convert';

import 'package:pixareo_test_task/models/recipe_model.dart';
import 'package:pixareo_test_task/models/user_model.dart';
import 'package:pixareo_test_task/services/network_service/network_service_interface.dart';
import 'package:pixareo_test_task/services/users_service/users_service_interface.dart';

//Этот API не просит ключа, так что просто сохраняем строку в переменную
String userUrl = 'https://jsonplaceholder.typicode.com/users';

class UsersService implements UsersServiceInterface {
  UsersService({this.networkService});

  NetworkServiceInterface? networkService;

  @override
  Future<List<User>> getUsers() async {
    List<User> users = [];

    try {
      String response = await networkService!.get(userUrl);
      List listOfUsers = json.decode(response);
      users = listOfUsers.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e);
    }
    return users;
  }
}
