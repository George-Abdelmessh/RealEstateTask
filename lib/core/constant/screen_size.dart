import 'package:flutter/material.dart';

class AppSize {

  static double widthScale(BuildContext context, double size) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Define a base width for scaling
    double baseWidth = 375.0;

    // Calculate the scaled size
    double scaledSize = size * (screenWidth / baseWidth);

    return scaledSize;
  }

  static double heightScale(BuildContext context, double size) {
    // Get the screen width
    double screenHeight = MediaQuery.of(context).size.height;

    // Define a base width for scaling
    double baseHeight = 375.0;

    // Calculate the scaled size
    double scaledSize = size * (screenHeight / baseHeight);

    return scaledSize;
  }
}
