import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_educational_app/src/screens/home/home_screen.dart';
import 'package:flutter_educational_app/src/screens/sign_in/sign_in.dart';
import 'package:flutter_educational_app/src/screens/sign_up/sign_up.dart';
import 'package:flutter_educational_app/src/wrapper.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settigs) {
    if (settigs.name == SignInScreen.routeName) {
      return MaterialPageRoute(builder: (context) {
        return SignInScreen();
      });
    } else if (settigs.name == SignUpScreen.routeName) {
      return MaterialPageRoute(builder: (context) {
        return SignUpScreen();
      });
    } else if (settigs.name == ForgotPasswordScreen.routeName) {
      return MaterialPageRoute(builder: (context) {
        return ForgotPasswordScreen();
      });
    } else if (settigs.name == Wrapper.routeName) {
      return MaterialPageRoute(builder: (context) {
        return Wrapper();
      });
    } else if (settigs.name == HomeScreen.routeName) {
      return MaterialPageRoute(builder: (context) {
        return HomeScreen();
      });
    } else {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text("data"),
        ),
      );
    });
  }
}
