import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/components/default_button.dart';
import 'package:flutter_educational_app/src/constants.dart';
import 'package:flutter_educational_app/src/custom_size.dart';

Future customBottomSheet(BuildContext context, String wrongTypeText,
    String wrongDescriptionText, String wrongButtonText, Function button) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Color(0xFF737373),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: customWidth(context, 30)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: customHeight(context, 350),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: customHeight(context, 15),
                ),
                height: customHeight(context, 5),
                width: customWidth(context, 114),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    3,
                  ),
                  color: bottomSheet,
                ),
              ),
              SizedBox(height: customHeight(context, 20)),
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: customWidth(context, 100),
              ),
              SizedBox(height: customHeight(context, 20)),
              Text(
                wrongTypeText ?? 'Loading...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: customHeight(context, 23),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: customHeight(context, 8)),
              Text(
                wrongDescriptionText ?? 'Loading...',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: customHeight(context, 15)),
              DefaultButton(
                text: wrongButtonText ?? 'Loading...',
                press: button ?? () {},
              ),
            ],
          ),
        );
      });
}
