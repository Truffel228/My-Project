import 'package:flutter/cupertino.dart';
import 'package:pixareo_test_task/models/user_model.dart';
import 'package:pixareo_test_task/repositories/users_repository/users_repository_interface.dart';
import 'package:pixareo_test_task/services/users_service/users_service_interface.dart';

class UsersRepository implements UsersRepositoryInterface{

  UsersRepository({@required this.usersService});

  UsersServiceInterface? usersService;

  @override
  Future<List<User>>? getUsers()=> usersService?.getUsers();

}