import 'package:flutter/material.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;

  const FormTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        maxLines: 50,
        minLines: 1,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
