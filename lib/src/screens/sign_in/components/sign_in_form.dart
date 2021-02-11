import 'package:flutter/material.dart';
import 'package:flutter_educational_app/data_model/authentication.dart';
import 'package:flutter_educational_app/src/components/bottom_sheet.dart';
import 'package:flutter_educational_app/src/components/default_button.dart';
import 'package:flutter_educational_app/src/components/error_form.dart';
import 'package:flutter_educational_app/src/constants.dart';
import 'package:flutter_educational_app/src/custom_size.dart';
import 'package:flutter_educational_app/src/helper/keyboard_util.dart';
import 'package:flutter_educational_app/src/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_educational_app/src/screens/home/home_screen.dart';
import 'package:flutter_educational_app/src/screens/sign_up/sign_up.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  AuthenticationModel _auth = AuthenticationModel();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool isLoading = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: customHeight(context, 30)),
          buildPasswordFormField(),
          SizedBox(height: customHeight(context, 30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: customHeight(context, 20)),
          DefaultButton(
            isLoading: isLoading,
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                KeyboardUtil.hideKeyboard(context);
                setState(() {
                  errors.clear();
                  isLoading = true;
                });
                _auth.signIn(email, password).then((value) {
                  setState(() {
                    isLoading = false;
                  });
                  if (value == "SignIn Successfully") {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  } else if (value == "Not Found") {
                    customBottomSheet(
                        context,
                        "Account Wasn't Not Found",
                        "We could not find your account, make sure to enter the right informatuon or if you don't have an account press on SignUp",
                        "SignUp", () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    });
                  } else if (value == "Blocked") {
                    customBottomSheet(
                        context,
                        "Account Blocked",
                        "It seems that you violated the Terms and Condition of use, so your account is currently closed, for more information",
                        "Contact With Us", () {
                      Navigator.of(context).pop();
                      //TODO Contact With Us
                    });
                  } else if (value == "Wrong Password") {
                    customBottomSheet(
                        context,
                        "Wrong Password",
                        "It seems that you entered the password incorrectly, make sure to enter the right password or if you forgot the password press on forgot password",
                        "Forgot Password", () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName);
                    });
                  } else {
                    customBottomSheet(
                        context,
                        "SignIn Failed",
                        "Check your internet connection, or check the informatuon you entered and tey again",
                        "Try Again", () {
                      Navigator.of(context).pop();
                    });
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        password = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
          return null;
        } else if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          return null;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
          color: textColor,
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        } else if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
          return null;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.local_phone,
          color: textColor,
        ),
      ),
    );
  }
}
