import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/components/no_account.dart';
import 'package:flutter_educational_app/src/custom_size.dart';
import 'package:flutter_educational_app/src/screens/sign_in/components/sign_in_form.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: customWidth(context, 20.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: customHeight(context, 28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your Email and Password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SignInForm(),
                SizedBox(height: customHeight(context, 20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
