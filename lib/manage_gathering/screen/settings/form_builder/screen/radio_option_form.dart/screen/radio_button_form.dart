import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/radio_option_form.dart/bloc/radio_option_form_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

import '../../../model/form_builder_model.dart';

class RadioButtonFormPage extends StatefulWidget {
  const RadioButtonFormPage({super.key});

  @override
  State<RadioButtonFormPage> createState() => _RadioButtonFormPageState();
}

class _RadioButtonFormPageState extends State<RadioButtonFormPage> {
  final TextEditingController radioLabelController = TextEditingController();

  final TextEditingController radioHelperTextController =
      TextEditingController();

  bool isSelected = false;

  void isSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            BlocBuilder<RadioOptionFormBloc, RadioOptionFormState>(
              builder: (context, state) {
                return ListView.builder(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  itemCount: state.textFields.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // log(newControllerList[index].text);
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: state.textFields[index],
                            decoration: InputDecoration(
                              hintText: "Option ${index + 1}",
                              labelText: "Option ${index + 1}",
                            ),
                          ),
                        ),
                        if (index == state.textFields.length - 1)
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => context
                                .read<RadioOptionFormBloc>()
                                .add(AddFiledOptionEvent()),
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => context
                                .read<RadioOptionFormBloc>()
                                .add(DeleteFieldOptionEvent(index: index)),
                          ),
                      ],
                    );
                  },
                );
              },
            ),
            FormTextFieldWidget(
                controller: radioHelperTextController,
                labelText: "Helper text(Optional)",
                hintText: "Enter helper text"),
            ListTile(
              onTap: () => isSelect(),
              contentPadding: const EdgeInsets.only(left: 0),
              horizontalTitleGap: 5,
              leading: Checkbox(
                value: isSelected,
                onChanged: (value) {
                  isSelect();
                },
              ),
              title: Text(
                "This field is mandatory",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            BlocBuilder<RadioOptionFormBloc, RadioOptionFormState>(
          builder: (context, state) {
            return BottomAppBar(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      List<String> radioOptionsList = [];

                      for (var element in state.textFields) {
                        radioOptionsList.add(element.text);
                      }

                      final radioForm = FormBuilderModel(
                          formType: FormType.radioOptions,
                          label: radioLabelController.text,
                          radioOption: radioOptionsList,
                          helperText: radioHelperTextController.text,
                          isMadatory: isSelected);

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
          },
        ),
      ),
    );
  }
}
