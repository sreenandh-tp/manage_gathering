import 'dart:developer';

import 'package:flutter/material.dart';

class TicketTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? helpText;
  final TextInputType textInputType;

  const TicketTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.helpText, required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: TextFormField(
        keyboardType: textInputType,
        validator: (value) {
          log("print value $value");
          if (value!.isNotEmpty) {
            return null;
          } else {
            return "Enter valid ${labelText.toLowerCase()}";
          }
        },
        decoration: InputDecoration(
          helperText: helpText,
          helperStyle: Theme.of(context).textTheme.labelSmall,
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
