import 'package:flutter/material.dart';
import '../menu_screen.dart';
import 'restaurant_screen.dart';
import 'other_screen.dart';
import '../zoom_scaffold.dart';
import 'products_screen.dart';
import 'log_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State < HomePage > {

  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'THE PADDOCK',
      ),
      new MenuItem(
        id: 'products',
        title: 'PRODUCTS',
      ),
      new MenuItem(
        id: 'other1',
        title: 'THE HERO',
      ),
      new MenuItem(
        id: 'other2',
        title: 'SETTINGS',
      ),
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffold(
      menuScreen: new MenuScreen(
        menu: menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          if (itemId == 'restaurant'){
            setState(() => activeScreen = restaurantScreen);
          }
          if (itemId == 'products'){
            setState(() => activeScreen = productsScreen);  
          }
          if (itemId == 'other1'){
            setState(() => activeScreen = otherScreen);  
          }
          if (itemId == 'other2'){
            setState(() => activeScreen = loginScreen);  
          } 
        },
      ),
      contentScreen: activeScreen,
    );
  }
}