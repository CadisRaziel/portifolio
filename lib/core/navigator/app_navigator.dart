import 'package:flutter/cupertino.dart';

enum NavigationType {
  pushNamed,
  pushNamedAndRemoveUntil,
}

class AppNavigator {
  static navigateToNamed(
    BuildContext context,
    String routeName,
    NavigationType navigationType,
  ) {
    if (navigationType == NavigationType.pushNamed) {
      return Navigator.of(context).pushNamed(routeName);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(routeName, (route) => false);
    }
  }
}
