import 'package:flutter/material.dart';
import 'package:flutter_educational_app/src/constants.dart';
import 'package:flutter_educational_app/src/custom_size.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length,
          (index) => formErrorText(error: errors[index], context: context)),
    );
  }

  Row formErrorText({String error, BuildContext context}) {
    return Row(
      children: [
        Icon(
          Icons.error,
          color: errorColor,
          size: customHeight(context, 20),
        ),
        SizedBox(
          width: customWidth(context, 10),
        ),
        Text(error),
      ],
    );
  }
}
