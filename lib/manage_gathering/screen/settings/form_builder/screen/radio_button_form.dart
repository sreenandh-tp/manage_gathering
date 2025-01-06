import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

import '../model/form_builder_model.dart';

class RadioButtonFormPage extends StatelessWidget {
  RadioButtonFormPage({super.key});

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

  final TextEditingController radioLabelController = TextEditingController();

  final TextEditingController radioHelperTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSelectedNotifier = ValueNotifier(false);

    void isSelect() {
      isSelectedNotifier.value = !isSelectedNotifier.value;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text("Radio Options"),
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
          children: [
            FormTextFieldWidget(
              controller: radioLabelController,
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
                      log(newControllerList[index].text);
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
                controller: radioHelperTextController,
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
                        List<String> radioOptionsList = [];

                        for (var element in newControllerList) {
                          radioOptionsList.add(element.text);
                        }

                        final radioForm = FormBuilderModel(
                            formType: FormType.radioOptions,
                            label: radioLabelController.text,
                            radioOption: radioOptionsList,
                            helperText: radioHelperTextController.text,
                            isMadatory: isSelectedNotifier.value);

                        if (radioOptionsList.isNotEmpty &&
                            radioLabelController.text.isNotEmpty) {
                          context
                              .read<FormBuilderBloc>()
                              .add(AddFormsEvent(formBuilderModel: radioForm));
                          Navigator.pop(context);
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
