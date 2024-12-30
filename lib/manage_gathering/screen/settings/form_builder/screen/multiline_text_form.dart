import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class MultilineTextFormPage extends StatelessWidget {
  const MultilineTextFormPage({super.key});

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
        title: const Text("Multiline Text"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        // padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
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
          ValueListenableBuilder(
              valueListenable: isSelectedNotifier,
              builder: (BuildContext ctx, bool newValue, Widget? _) {
                return ListTile(
                  onTap: () => isSelect(),
                  horizontalTitleGap: 5,
                  contentPadding: const EdgeInsets.only(left: 0),
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
