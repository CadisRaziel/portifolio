import 'package:flutter/material.dart';
import 'package:portifolio_vitor/presenter/pages/contato_page.dart';
import 'package:portifolio_vitor/presenter/pages/home_page.dart';
import 'package:portifolio_vitor/presenter/splash/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/splashScreen": (context) => const SplashPage(),
    "/home": (context) => const HomePage(),
    "/contato": (context) => const ContatoPage(),
  };
}
