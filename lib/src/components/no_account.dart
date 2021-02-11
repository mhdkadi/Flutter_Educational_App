import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/constants.dart';
import 'package:flutter_educational_app/src/custom_size.dart';
import 'package:flutter_educational_app/src/screens/sign_up/sign_up.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: customWidth(context, 16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: customWidth(context, 16), color: primaryColor),
          ),
        ),
      ],
    );
  }
}
