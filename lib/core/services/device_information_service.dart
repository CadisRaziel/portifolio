import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, web }

class DeviceInformationService {
  static double screenPerimeter(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenPerimeter = ((screenWidth * 2) + (screenHeight * 2));
    return screenPerimeter;
  }

  static DeviceType getDevice(BuildContext context) {
    if (MediaQuery.of(context).size.width <= 449) {
      return DeviceType.mobile;
    } else if (MediaQuery.of(context).size.width >= 450 &&
        MediaQuery.of(context).size.width <= 999) {
      return DeviceType.tablet;
    } else {
      return DeviceType.web;
    }
  }
}
