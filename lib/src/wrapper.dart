import 'package:flutter/material.dart';
import 'package:flutter_educational_app/data_model/authentication.dart';
import 'package:flutter_educational_app/src/components/loading.dart';
import 'package:flutter_educational_app/src/screens/home/home_screen.dart';
import 'package:flutter_educational_app/src/screens/sign_in/sign_in.dart';

class Wrapper extends StatelessWidget {
  static String routeName = "/sign_in";
  final AuthenticationModel currentState = AuthenticationModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentState.getCurrentState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == 'HomeScreen') {
            return HomeScreen();
          } else if (snapshot.data == 'SignInScreen') {
            return SignInScreen();
          } else if (snapshot.data == 'BlockedScreen') {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Center(
                child: Text("Blocked"),
              ),
            );
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Center(
                child: Text("No connection"),
              ),
            );
          }
        } else {
          return Loading();
        }
      },
    );
  }
}
