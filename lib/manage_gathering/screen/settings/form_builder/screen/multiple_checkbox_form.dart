import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class MultipleCheckboxFormPage extends StatelessWidget {
  MultipleCheckboxFormPage({super.key});

  final ValueNotifier<List<TextEditingController>> controllerListNotifier =
      ValueNotifier<List<TextEditingController>>([TextEditingController()]);

  void addNewField() {
    final currentList =
        List<TextEditingController>.from(controllerListNotifier.value);
    currentList.insert(0, TextEditingController());
    controllerListNotifier.value = currentList;
  }

  void removeField(int index) {
    if (controllerListNotifier.value.length > 1) {
      final currentList =
          List<TextEditingController>.from(controllerListNotifier.value);
      currentList[index].dispose();
      currentList.removeAt(index);
      controllerListNotifier.value = currentList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSelectedNotifier = ValueNotifier(false);

    void isSelect() {
      isSelectedNotifier.value = !isSelectedNotifier.value;
    }

    final dialoge = ShowDialoge();

    final TextEditingController labelController = TextEditingController();
    final TextEditingController helperTextController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text("Multiline Check Box"),
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
          shrinkWrap: true,
          children: [
            FormTextFieldWidget(
              controller: labelController,
              labelText: "Label",
              hintText: "Enter label",
            ),
            ValueListenableBuilder(
                valueListenable: controllerListNotifier,
                builder: (BuildContext ctx,
                    List<TextEditingController> newControllerList, Widget? _) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    itemCount: newControllerList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: newControllerList[index],
                              decoration: InputDecoration(
                                hintText: "Option ${index + 1}",
                                labelText: "Option ${index + 1}",
                              ),
                            ),
                          ),
                          if (index == newControllerList.length - 1)
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: addNewField,
                            )
                          else
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => removeField(index),
                            ),
                        ],
                      );
                    },
                  );
                }),
            FormTextFieldWidget(
                controller: helperTextController,
                labelText: "Helper text(Optional)",
                hintText: "Enter helper text"),
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
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: controllerListNotifier,
            builder: (BuildContext ctx,
                List<TextEditingController> newControllerList, Widget? _) {
              return BottomAppBar(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        List<String> multipleCheckBoxList = [];

                        for (var element in newControllerList) {
                          multipleCheckBoxList.add(element.text);
                        }

                        log(newControllerList.toString());

                        final multipleCheckBoxForm = FormBuilderModel(
                            formType: FormType.multipleCheckBox,
                            label: labelController.text,
                            checkBoxOption: multipleCheckBoxList,
                            helperText: helperTextController.text,
                            isMadatory: isSelectedNotifier.value);

                        if (multipleCheckBoxList.isNotEmpty &&
                            labelController.text.isNotEmpty) {
                          context.read<FormBuilderBloc>().add(AddFormsEvent(
                              formBuilderModel: multipleCheckBoxForm));
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
