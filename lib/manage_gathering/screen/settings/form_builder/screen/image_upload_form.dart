import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class ImageUploadFormPage extends StatelessWidget {
  const ImageUploadFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSelectedNotifier = ValueNotifier(false);

    void isSelect() {
      isSelectedNotifier.value = !isSelectedNotifier.value;
    }

    final dialoge = ShowDialoge();
    final TextEditingController imageLabelController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text("Image Upload"),
          actions: [
            IconButton(
              onPressed: () {
                dialoge.showDialoge(
                  "Delete",
                  "Are you sure? you want to delete this field",
                  context,
                  TextButton(onPressed: () {}, child: const Text("Delete")),
                );
              },
              icon: const Icon(Icons.delete_outline),
            )
          ],
        ),
        body: ListView(
          children: [
            FormTextFieldWidget(
                controller: imageLabelController,
                labelText: "Label",
                hintText: "Enter label"),
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
                onPressed: () {
                  final imageForm = FormBuilderModel(
                      formType: FormType.imageUpload,
                      label: imageLabelController.text,
                      isMadatory: isSelectedNotifier.value);

                  context
                      .read<FormBuilderBloc>()
                      .add(AddFormsEvent(formBuilderModel: imageForm));
                        Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
