import 'package:flutter/material.dart';
import 'package:portifolio_vitor/core/app_widget.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const AppWidget());
}
