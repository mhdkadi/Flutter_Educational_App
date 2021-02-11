import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/custom_size.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.isLoading = false,
  }) : super(key: key);
  final String text;
  final Function press;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: customHeight(context, 56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: primaryColor,
        onPressed: press,
        child: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                backgroundColor: Colors.white,
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: customWidth(context, 18),
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
