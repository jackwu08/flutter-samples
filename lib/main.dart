import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_samples/animations/main_animations.dart';
//import 'package:flutter_samples/app_clone/main_apps_clone.dart';
//import 'package:flutter_samples/appbar_sliverappbar/main_appbar_sliverappbar.dart';
//import 'package:flutter_samples/collapsing_toolbar/main_collapsing_toolbar.dart';
//import 'package:flutter_samples/communication_widgets/main_communication_widgets.dart';
//import 'package:flutter_samples/fetch_data/main_fetch_data.dart';
//import 'package:flutter_samples/hero_animations/main_hero_animations.dart';
//import 'package:flutter_samples/menu_navigations/main_menu_navigations.dart';
//import 'package:flutter_samples/persistent_tabbar/main_persistent_tabbar.dart';
//import 'package:flutter_samples/scroll_controller/main_scroll_controller.dart';
//import 'package:flutter_samples/size_and_position/main_size_and_position.dart';
//import 'package:flutter_samples/split_image/main_split_image.dart';

import 'package:flutter_samples/models/favorites.dart';
import 'package:flutter_samples/screens/favorites.dart';
import 'package:provider/provider.dart';


void main() => runApp(const TestingApp());


class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //routes: {
        //  HomePage.routeName: (context) => const HomePage(),
        //  FavoritesPage.routeName: (context) => const FavoritesPage(),
        //},
        //initialRoute: HomePage.routeName,
      ),
    );
  }
}