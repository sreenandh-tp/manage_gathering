import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class ImageUploadFormPage extends StatelessWidget {
  const ImageUploadFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSelectedNotifier = ValueNotifier(false);

    void isSelect() {
      isSelectedNotifier.value = !isSelectedNotifier.value;
    }

    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("Image Upload"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          )
        ],
      ),
      body: ListView(
        children: [
          FormTextFieldWidget(labelText: "Label", hintText: "Enter label"),
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
    );
  }
}
