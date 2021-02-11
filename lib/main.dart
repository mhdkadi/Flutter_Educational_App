import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/routs.dart';
import 'package:flutter_educational_app/src/theme.dart';
import 'package:flutter_educational_app/src/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
      //TODO onBoarding
      //TODO splash Screen

      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
