import 'package:flutter/material.dart';

Color primaryColor = Colors.green;
Color bottomSheet = Colors.grey[400];
Color textColor = Colors.grey[600];
Color errorColor = Colors.red[900];
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kEmailNullError = "Please Enter your Email";
const String kAddressNullError = "Please Enter your address";
