import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/animations/main_animations.dart';
import 'package:flutter_samples/app_clone/main_apps_clone.dart';
import 'package:flutter_samples/appbar_sliverappbar/main_appbar_sliverappbar.dart';
import 'package:flutter_samples/collapsing_toolbar/main_collapsing_toolbar.dart';
import 'package:flutter_samples/communication_widgets/main_communication_widgets.dart';
import 'package:flutter_samples/fetch_data/main_fetch_data.dart';
import 'package:flutter_samples/hero_animations/main_hero_animations.dart';
import 'package:flutter_samples/menu_navigations/main_menu_navigations.dart';
import 'package:flutter_samples/persistent_tabbar/main_persistent_tabbar.dart';
import 'package:flutter_samples/scroll_controller/main_scroll_controller.dart';
import 'package:flutter_samples/size_and_position/main_size_and_position.dart';
import 'package:flutter_samples/split_image/main_split_image.dart';

import 'package:flutter_samples/catalog.dart';
import 'package:flutter_samples/item_tile.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Catalog>(
      create: (context) => Catalog(),
      child: const MaterialApp(
        title: 'Infinite List Sample',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite List Sample'),
      ),
      body: Selector<Catalog, int?>(
        // Selector is a widget from package:provider. It allows us to listen
        // to only one aspect of a provided value. In this case, we are only
        // listening to the catalog's `itemCount`, because that's all we need
        // at this level.
        selector: (context, catalog) => catalog.itemCount,
        builder: (context, itemCount, child) => ListView.builder(
          // When `itemCount` is null, `ListView` assumes an infinite list.
          // Once we provide a value, it will stop the scrolling beyond
          // the last element.
          itemCount: itemCount,
          padding: const EdgeInsets.symmetric(vertical: 18),
          itemBuilder: (context, index) {
            // Every item of the `ListView` is individually listening
            // to the catalog.
            var catalog = Provider.of<Catalog>(context);

            // Catalog provides a single synchronous method for getting
            // the current data.
            var item = catalog.getByIndex(index);

            if (item.isLoading) {
              return const LoadingItemTile();
            }

            return ItemTile(item: item);
          },
        ),
      ),
    );
  }
}


