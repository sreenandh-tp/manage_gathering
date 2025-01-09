import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/drop_down_option/bloc/drop_down_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class DropDownFormPage extends StatefulWidget {
  const DropDownFormPage({super.key});

  @override
  State<DropDownFormPage> createState() => _DropDownFormPageState();
}

class _DropDownFormPageState extends State<DropDownFormPage> {
  final TextEditingController labelController = TextEditingController();

  final TextEditingController helperTextController = TextEditingController();

  List<TextEditingController> controllerList = [];

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
          title: const Text("Dropdown Options"),
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
            BlocBuilder<DropDownBloc, DropDownState>(
              builder: (context, state) {
                return ListView.builder(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  itemCount: state.textFields.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    controllerList.addAll(state.textFields);
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
                                .read<DropDownBloc>()
                                .add(AddDropDownTextFieldEvent()),
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => context.read<DropDownBloc>().add(
                                DeleteDropDownTextFieldEvent(index: index)),
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
        bottomNavigationBar: Builder(builder: (context) {
          return BlocBuilder<DropDownBloc, DropDownState>(
            builder: (context, state) {
              return BottomAppBar(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        List<String> dropDownOptions = [];

                        for (var element in state.textFields) {
                          dropDownOptions.add(element.text);
                        }

                        final dropDownForm = FormBuilderModel(
                            formType: FormType.dropDownOptions,
                            label: labelController.text,
                            dropDownOption: dropDownOptions,
                            helperText: helperTextController.text,
                            isMadatory: isSelected);

                        if (dropDownOptions.isNotEmpty &&
                            labelController.text.isNotEmpty) {
                          context.read<FormBuilderBloc>().add(
                              AddFormsEvent(formBuilderModel: dropDownForm));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
