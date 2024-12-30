import 'package:flutter/material.dart';
import 'package:manage_gathering/core/lists_page.dart';

class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({super.key});

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  final ValueNotifier<bool> isSelected = ValueNotifier(false);

  final TextEditingController termsAndConditionController =
      TextEditingController();

  @override
  void initState() {
    termsAndConditionController.text = dummyTermsAndConditions;
    super.initState();
  }

  @override
  void dispose() {
    termsAndConditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void isFieldSelected() {
      isSelected.value = !isSelected.value;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text(
          "Terms & Conditions",
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              isFieldSelected();
            },
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
          ValueListenableBuilder(
              valueListenable: isSelected,
              builder: (BuildContext context, dynamic newValue, Widget? child) {
                return TextFormField(
                  controller: termsAndConditionController,
                  enabled: isSelected.value,
                  minLines: 1,
                  maxLines: 150,
                  decoration: const InputDecoration(
                    hintText: "Enter Terms & Conditions",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}