import 'package:flutter/material.dart';

// Get the proportionate height as per screen size
double customHeight(BuildContext context, double inputHeight) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double customWidth(BuildContext context, double inputWidth) {
  double screenWidth = MediaQuery.of(context).size.width;
  return (inputWidth / 375.0) * screenWidth;
}
