import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/screens/sign_in/components/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SignInBody(),
    );
  }
}
