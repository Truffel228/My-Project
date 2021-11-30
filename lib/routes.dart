// В данном случае не совсем уместно делать функцию для мэпы с экранами, но
// для на глядности того как это должно выглядеть в большом проекте
// я решил это реализовать
import 'package:flutter/cupertino.dart';

import 'package:pixareo_test_task/screens/home_screen.dart';

final String homeScreen = '/home';

Map <String, WidgetBuilder> getRoutes() => {
  homeScreen: (BuildContext context) => HomeScreen(),
};