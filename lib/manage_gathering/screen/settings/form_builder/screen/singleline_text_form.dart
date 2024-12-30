import 'package:flutter/material.dart';
import 'package:manage_gathering/core/lists_page.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class SinglelineTextFormPage extends StatelessWidget {
  const SinglelineTextFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSelectedNotifier = ValueNotifier(false);

    void isSelect() {
      isSelectedNotifier.value = !isSelectedNotifier.value;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("Singleline Text"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const FormTextFieldWidget(
            labelText: "Label",
            hintText: "Enter label",
          ),
          const FormTextFieldWidget(
            labelText: "Placeholder text (Optional)",
            hintText: "Enter placeholder text",
          ),
          const FormTextFieldWidget(
            labelText: "Helper text (Optional)",
            hintText: "Enter helper text",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              "Field Type",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              spacing: 5,
              children: [
                ...List.generate(
                  singleLineFormType.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        label: Text(singleLineFormType[index]),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          ValueListenableBuilder(
              valueListenable: isSelectedNotifier,
              builder: (BuildContext ctx, bool newValue, Widget? _) {
                return ListTile(
                  onTap: () => isSelect(),
                  contentPadding: const EdgeInsets.only(left: 0),
                  horizontalTitleGap: 5,
                  leading: Checkbox(
                    value: newValue,
                    onChanged: (value) {
                      isSelect();
                    },
                  ),
                  title: Text(
                    "This field is mandatory",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Add"),
            ),
          ),
        ),
      ),
    );
  }
}
