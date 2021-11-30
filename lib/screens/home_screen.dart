import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixareo_test_task/bloc/home/home_bloc.dart';
import 'package:pixareo_test_task/components/custom_button.dart';
import 'package:pixareo_test_task/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.limeColor,
        title: Text('My Bloc App'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialState) {
            bottomNavigationBar = null;
            return SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // 2 кнопки "Загрузить пользователей" и "Загрузить рецепты"
                  // Использем Wrap, так как если вдруг текст в кнопках окажется
                  // слишком длинным, то у нас не будет переполнения, вместо
                  // этого на ряд из кнопок превратиться в колонку
                  // Если же использовать Row, то при слишком длинном тексте,
                  // будет переполнение ряда
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      CustomButton(
                        onPressed: () {
                          bloc.add(HomeLoadUsersEvent());
                        },
                        icon: Icon(FontAwesomeIcons.male,
                            size: Constants.defaultIconSize,
                            color: Constants.defaultIconColor),
                        title: Strings.loadUsers, // Load users
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.yellowColor),
                        ),
                      ),
                      SizedBox(
                        width: Constants.defaultPadding,
                      ),
                      CustomButton(
                        onPressed: () {
                          bloc.add(HomeLoadRecipesEvent());
                        },
                        icon: Icon(
                          FontAwesomeIcons.hamburger,
                          size: Constants.defaultIconSize,
                          color: Constants.defaultIconColor,
                        ),
                        title: Strings.loadRecipes,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.oliveGreenColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Constants.defaultPadding,
                  ),
                  // кнопка "Очистить"
                  CustomButton(
                    onPressed: () {
                      bloc.add(HomeCleanEvent());
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.orangeColor)),
                    title: Strings.clear,
                    icon: Icon(
                      FontAwesomeIcons.trash,
                      size: Constants.defaultIconSize,
                      color: Constants.defaultIconColor,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(color: Constants.limeColor),
            );
          }
          if (state is HomeLoadedRecipesState) {
            bottomNavigationBar = _buildBottomNavigationBar();
            return SizedBox.expand(
              child: ListView.builder(
                itemCount: state.recipes!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.recipes![index].title as String,
                      style: TextStyle(fontSize: Constants.largeFontSize),
                      overflow: TextOverflow.ellipsis,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: Constants.defaultPadding,
                        vertical: Constants.defaultPadding / 2),
                    tileColor: index % 2 == 0
                        ? Constants.orangeColor.withOpacity(0.8)
                        : Constants.yellowColor.withOpacity(0.8),
                    leading: Image.network(
                      state.recipes![index].url as String,
                    ),
                  );
                },
              ),
            );
          }
          if (state is HomeLoadedUsersState) {
            bottomNavigationBar = _buildBottomNavigationBar();
            return SizedBox.expand(
              child: ListView.builder(
                itemCount: state.users!.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: Constants.listTileUserHeight,
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            state.users![index].name as String,
                            style: TextStyle(
                                fontSize: Constants.giantFontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(state.users![index].email as String),
                          Text(
                            state.users![index].city as String,
                          ),
                        ],
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Constants.defaultPadding,
                          vertical: Constants.defaultPadding / 4),
                      tileColor: index % 2 == 0
                          ? Constants.orangeColor.withOpacity(0.8)
                          : Constants.yellowColor.withOpacity(0.8),
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.sadTear, size: Constants.errorIconSize),
                SizedBox(
                  height: Constants.defaultPadding,
                ),
                Text(
                  Strings.error,
                  style: TextStyle(
                      fontSize: Constants.errorTextSize,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Constants.defaultPadding,
                ),
                CustomButton(
                  onPressed: () {
                    bloc.add(HomeCleanEvent());
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.orangeColor)),
                  title: Strings.clear,
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    size: Constants.defaultIconSize,
                    color: Constants.defaultIconColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialState) return SizedBox();
          if (state is HomeLoadedUsersState)
            return SizedBox(
              height: Constants.bottomNavigationBarHeight,
              child: _buildBottomNavigationBar(),
            );
          if (state is HomeLoadedRecipesState)
            return SizedBox(
              height: Constants.bottomNavigationBarHeight,
              child: _buildBottomNavigationBar(),
            );
          return SizedBox();
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: CustomButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(HomeLoadUsersEvent());
            },
            icon: Icon(FontAwesomeIcons.male,
                size: Constants.defaultIconSize,
                color: Constants.defaultIconColor),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Constants.yellowColor),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CustomButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(HomeCleanEvent());
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Constants.orangeColor)),
            icon: Icon(
              FontAwesomeIcons.trash,
              size: Constants.defaultIconSize,
              color: Constants.defaultIconColor,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CustomButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(HomeLoadRecipesEvent());
            },
            icon: Icon(
              FontAwesomeIcons.hamburger,
              size: Constants.defaultIconSize,
              color: Constants.defaultIconColor,
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Constants.oliveGreenColor),
            ),
          ),
          label: '',
        )
      ],
    );
  }
}
