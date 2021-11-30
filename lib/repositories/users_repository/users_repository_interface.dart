import 'package:pixareo_test_task/models/user_model.dart';

abstract class UsersRepositoryInterface{
  Future<List<User>>? getUsers();
}