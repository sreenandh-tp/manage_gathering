import 'package:flutter/material.dart';

class TermsAndConditionPage extends StatelessWidget {
  const TermsAndConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text(
          "Terms & Conditions",
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 18,
            ),
            label: const Text("Edit"),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 150,
            decoration: const InputDecoration(
              hintText: "Enter Terms & Conditions",
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
