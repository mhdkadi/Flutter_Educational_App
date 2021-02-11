import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/custom_size.dart';

import 'sign_up_form.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: customWidth(context, 20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04), // 4%
                Text("Register Account",
                    style: TextStyle(
                      fontSize: customHeight(context, 28),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.5,
                    )),
                Text(
                  "Complete your details by entering \nyour Email and Password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                SignUpForm(),

                SizedBox(height: customHeight(context, 20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: customHeight(context, 10)),
                Text(
                  'Read our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.button,
                ), //TODO Term and Condition
              ],
            ),
          ),
        ),
      ),
    );
  }
}
