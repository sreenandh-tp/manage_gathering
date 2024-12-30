import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/widget/form_textfield_widget.dart';

class RadioButtonFormPage extends StatefulWidget {
  const RadioButtonFormPage({super.key});

  @override
  State<RadioButtonFormPage> createState() => _RadioButtonFormPageState();
}

class _RadioButtonFormPageState extends State<RadioButtonFormPage> {
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("Radio Options"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const FormTextFieldWidget(
            labelText: "Label",
            hintText: "Enter label",
          ),
          ListView.builder(
            padding: const EdgeInsets.only(left: 15, right: 15),
            itemCount: controllers.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
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
                ),
              );
            },
          ),
          const FormTextFieldWidget(
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
    );
  }
}