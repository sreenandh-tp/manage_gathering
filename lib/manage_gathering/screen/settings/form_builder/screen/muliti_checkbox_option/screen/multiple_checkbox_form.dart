import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/muliti_checkbox_option/bloc/multi_checkbox_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class MultipleCheckboxFormPage extends StatefulWidget {
  const MultipleCheckboxFormPage({super.key});

  @override
  State<MultipleCheckboxFormPage> createState() =>
      _MultipleCheckboxFormPageState();
}

class _MultipleCheckboxFormPageState extends State<MultipleCheckboxFormPage> {
  bool isSelected = false;

  void isSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              controller: labelController,
              labelText: "Label",
              hintText: "Enter label",
            ),
            BlocBuilder<MultiCheckboxBloc, MultiCheckboxState>(
              builder: (context, state) {
                return ListView.builder(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  itemCount: state.textFields.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                                .read<MultiCheckboxBloc>()
                                .add(AddMultiTextFiledEvent()),
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => context
                                .read<MultiCheckboxBloc>()
                                .add(DeleteMultiTextFiledEvent(index: index)),
                          ),
                      ],
                    );
                  },
                );
              },
            ),
            FormTextFieldWidget(
                controller: helperTextController,
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
        bottomNavigationBar: BlocBuilder<MultiCheckboxBloc, MultiCheckboxState>(
          builder: (context, state) {
            return BottomAppBar(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      List<String> multipleCheckBoxList = [];

                      for (var element in state.textFields) {
                        multipleCheckBoxList.add(element.text);
                      }

                      final multipleCheckBoxForm = FormBuilderModel(
                          formType: FormType.multipleCheckBox,
                          label: labelController.text,
                          checkBoxOption: multipleCheckBoxList,
                          helperText: helperTextController.text,
                          isMadatory: isSelected);

                      if (multipleCheckBoxList.isNotEmpty &&
                          labelController.text.isNotEmpty) {
                        context.read<FormBuilderBloc>().add(AddFormsEvent(
                            formBuilderModel: multipleCheckBoxForm));
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
