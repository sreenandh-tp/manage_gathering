import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TicketTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? helpText;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final int? minLine;
   final int? maxLine;


  const TicketTextFieldWidget({
    super.key,
    required this.labelText,
    this.inputFormatter,
    required this.hintText,
    this.helpText,
    required this.textInputType,
    this.minLine,
    this.maxLine
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: TextFormField(
        minLines: minLine,
        maxLines: maxLine,
        keyboardType: textInputType,
        inputFormatters: inputFormatter,
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
