import 'package:flutter/material.dart';
import './pages/login_page.dart';
import './pages/intro_pages.dart';
import 'splash_screen.dart';


void main() {
  runApp(MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder> {
      "/LoginPage": (BuildContext context) => new LoginPage(),
      "/IntroPage": (BuildContext context) => new IntroPages(),
    },
    debugShowCheckedModeBanner: false,
  ));
}