import 'package:pixareo_test_task/models/recipe_model.dart';
import 'package:pixareo_test_task/models/user_model.dart';

abstract class UsersServiceInterface{
  Future<List<User>> getUsers();
}