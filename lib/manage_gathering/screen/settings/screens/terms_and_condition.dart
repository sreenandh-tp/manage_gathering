import 'package:flutter/material.dart';
import 'package:manage_gathering/core/lists_page.dart';

class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({super.key});

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {


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
   

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text(
          "Terms & Conditions",
        ),
        actions: [
          AnimatedOpacity(
            opacity:  0.3 ,
            duration: const Duration(milliseconds: 300),
            child: TextButton.icon(
              onPressed: () {
             
              },
              icon: const Icon(
                Icons.edit,
                size: 18,
              ),
              label: const Text("Edit"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        children: [
          TextFormField(
            controller: termsAndConditionController,
            enabled: false,
            minLines: 1,
            maxLines: 150,
            decoration: const InputDecoration(
              hintText: "Enter Terms & Conditions",
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity:  1.0 ,
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
