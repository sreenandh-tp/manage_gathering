import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class DropDownFormPage extends StatefulWidget {
  const DropDownFormPage({super.key});

  @override
  State<DropDownFormPage> createState() => _DropDownFormPageState();
}

class _DropDownFormPageState extends State<DropDownFormPage> {
  final List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();

    controllers.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addField() {
    setState(() {
      controllers.insert(0, TextEditingController());
    });
  }

  void removeField(int index) {
    setState(() {
      controllers[index].dispose();
      controllers.removeAt(index);
    });
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
          leading: const CloseButton(
            
          ),
          title: const Text("Dropdown Options"),
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
            ListView.builder(
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemCount: controllers.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controllers[index],
                        decoration: InputDecoration(
                          hintText: "Option ${index + 1}",
                          labelText: "Option ${index + 1}",
                        ),
                      ),
                    ),
                    controllers.length > 1 && index != controllers.length - 1
                        ? IconButton(
                            onPressed: () {
                              removeField(index);
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              size: 18,
                            ))
                        : index == controllers.length - 1
                            ? IconButton(
                                onPressed: () {
                                  addField();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 18,
                                ))
                            : const SizedBox()
                  ],
                );
              },
            ),
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
      ),
    );
  }
}
