import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class MultilineTextFormPage extends StatelessWidget {
  const MultilineTextFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSelectedNotifier = ValueNotifier(false);

    void isSelect() {
      isSelectedNotifier.value = !isSelectedNotifier.value;
    }



    final TextEditingController labelController = TextEditingController();
    final TextEditingController placeHolderTextController =
        TextEditingController();
    final TextEditingController helperTextController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text("Multiline Text"),
          actions: [
            IconButton(
              onPressed: () {
                ShowDialoge().showDialoge(
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
          shrinkWrap: true,
          // padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          children: [
            FormTextFieldWidget(
              controller: labelController,
              labelText: "Label",
              hintText: "Enter label",
            ),
            FormTextFieldWidget(
              controller: placeHolderTextController,
              labelText: "Placeholder text (Optional)",
              hintText: "Enter placeholder text",
            ),
            FormTextFieldWidget(
              controller: helperTextController,
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
                onPressed: () {
                  final multiLineForm = FormBuilderModel(
                      formType: FormType.multiLineText,
                      label: labelController.text,
                      isMadatory: isSelectedNotifier.value,
                      placeHolderText: placeHolderTextController.text,
                      helperText: helperTextController.text);

                  context
                      .read<FormBuilderBloc>()
                      .add(AddFormsEvent(formBuilderModel: multiLineForm));
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
