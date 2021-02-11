import 'package:flutter_educational_app/src/components/default_button.dart';
import 'package:flutter_educational_app/src/components/error_form.dart';
import 'package:flutter_educational_app/src/components/no_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/custom_size.dart';

import '../../../constants.dart';

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  bool isLoading = false;
  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
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
          ),
          SizedBox(height: customHeight(context, 30)),
          FormError(errors: errors),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          DefaultButton(
            isLoading: isLoading,
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                setState(() {
                  errors.clear();
                });
                // Do what you want to do  //TODO ForgotPass
              }
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
