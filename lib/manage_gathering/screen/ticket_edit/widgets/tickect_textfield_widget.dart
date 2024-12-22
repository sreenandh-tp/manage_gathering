import 'dart:developer';

import 'package:flutter/material.dart';

class TicketTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? helpText;

  const TicketTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.helpText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
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
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.labelLarge,
          hintText: hintText,
        ),
      ),
    );
  }
}
