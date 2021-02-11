import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/custom_size.dart';
import 'package:flutter_educational_app/src/screens/forgot_password/components/forgot_password.dart';

class ForgotPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: customWidth(context, 20)),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: customWidth(context, 28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your Email and we will send \nyou a code to reset your password",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}
