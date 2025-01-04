import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/core/lists_page.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/model/form_builder_model.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/preview_page.dart';

class FormsBuilderPage extends StatefulWidget {
  const FormsBuilderPage({super.key});

  @override
  State<FormsBuilderPage> createState() => _FormsBuilderPageState();
}

class _FormsBuilderPageState extends State<FormsBuilderPage> {
  final TextEditingController formTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> enableSwitchNotifier = ValueNotifier(false);

    void isEnable() {
      enableSwitchNotifier.value = !enableSwitchNotifier.value;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text("Registration Form"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PreviewPage(),
                    ));
              },
              child: const Text("Preview"),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, bottom: 10),
              child: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: TextFormField(
                        controller: formTitleController,
                        decoration: const InputDecoration(
                          labelText: "Form title",
                          hintText: "Enter your form title",
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: enableSwitchNotifier,
                        builder: (BuildContext context, bool newValue,
                            Widget? child) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            onTap: () {
                              isEnable();
                            },
                            title: Text(
                              "Enable registration form",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            trailing: Switch(
                              value: enableSwitchNotifier.value,
                              onChanged: (value) {
                                isEnable();
                              },
                            ),
                          );
                        }),
                    BlocBuilder<FormBuilderBloc, FormBuilderState>(
                      builder: (context, state) {
                        return ReorderableListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              key: ValueKey(state.formList[index]),
                              contentPadding:
                                  const EdgeInsets.only(left: 5, bottom: 10),
                              leading: state.formList[index].formType ==
                                      FormType.singleLineForm
                                  ? const Icon(Icons.abc)
                                  : state.formList[index].formType ==
                                          FormType.multiLineText
                                      ? const Icon(Icons.menu)
                                      : state.formList[index].formType ==
                                              FormType.radioOptions
                                          ? const Icon(
                                              Icons.check_circle_outline)
                                          : state.formList[index].formType ==
                                                  FormType.multipleCheckBox
                                              ? const Icon(
                                                  Icons.check_box_outlined)
                                              : state.formList[index]
                                                          .formType ==
                                                      FormType.dropDownOptions
                                                  ? const Icon(Icons
                                                      .arrow_drop_down_circle_outlined)
                                                  : state.formList[index]
                                                              .formType ==
                                                          FormType.imageUpload
                                                      ? const Icon(Icons
                                                          .photo_camera_back_outlined)
                                                      : const SizedBox(),
                              title: Text(
                                state.formList[index].label,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                state.formList[index].formType.name
                                    .toLowerCase(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 18,
                                  )),
                            );
                          },
                          itemCount: state.formList.length,
                          onReorder: (oldIndex, newIndex) {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }

                            context.read<FormBuilderBloc>().add(
                                ReOrderableListEvent(
                                    newIndex: newIndex, oldIndex: oldIndex));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  context.read<FormBuilderBloc>().add(
                      AddFormTitleEvent(formTitle: formTitleController.text));
                  showModalBottomSheet(
                    useRootNavigator: true,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                          child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: formItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => formPages[index],
                                  ));
                            },
                            leading: Icon(formIcons[index]),
                            title: Text(
                              formItems[index],
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          );
                        },
                      ));
                    },
                  );
                },
                label: const Text("Add Field"),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
