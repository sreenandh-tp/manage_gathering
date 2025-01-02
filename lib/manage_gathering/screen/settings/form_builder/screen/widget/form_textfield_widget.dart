import 'package:flutter/material.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const FormTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        controller: controller,
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
