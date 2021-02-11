import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/constants.dart';
import 'package:flutter_educational_app/src/custom_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitCircle(
          color: primaryColor,
          size: customWidth(context, 70),
        ),
      ),
    );
  }
}
