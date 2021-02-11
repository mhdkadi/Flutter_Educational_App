import 'package:flutter/material.dart';
import 'package:flutter_educational_app/data_model/authentication.dart';
import 'package:flutter_educational_app/src/components/bottom_sheet.dart';
import 'package:flutter_educational_app/src/components/default_button.dart';
import 'package:flutter_educational_app/src/components/error_form.dart';
import 'package:flutter_educational_app/src/custom_size.dart';
import 'package:flutter_educational_app/src/screens/home/home_screen.dart';
import 'package:flutter_educational_app/src/screens/sign_in/sign_in.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  AuthenticationModel _auth = AuthenticationModel();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conformPassword;
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
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: customHeight(context, 40)),
          DefaultButton(
            isLoading: isLoading,
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                setState(() {
                  errors.clear();
                  isLoading = true;
                });
                _auth.signUp(email, password).then((value) {
                  setState(() {
                    isLoading = false;
                  });
                  if (value == "SignUp Successfully") {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  } else if (value == "Already Exists") {
                    customBottomSheet(
                        context,
                        "Account Already Exists",
                        "The account you entered already exists, enter a new account or click on SignIn to return to your account",
                        "SignIn", () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    });
                  } else {
                    customBottomSheet(
                        context,
                        "SignUp Failed",
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

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: kMatchPassError);
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        } else if (password == value) {
          removeError(error: kMatchPassError);
          return null;
        } else if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          return null;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
          color: textColor,
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
