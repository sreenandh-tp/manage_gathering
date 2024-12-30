import 'package:flutter/material.dart';
import 'package:manage_gathering/core/lists_page.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/preview_page.dart';

class FormsBuilderPage extends StatelessWidget {
  const FormsBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> enableSwitchNotifier = ValueNotifier(false);

    void isEnable() {
      enableSwitchNotifier.value = !enableSwitchNotifier.value;
    }

    return Scaffold(
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
                      decoration: const InputDecoration(
                          labelText: "Form title",
                          hintText: "Enter your form title"),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: enableSwitchNotifier,
                      builder:
                          (BuildContext context, bool newValue, Widget? child) {
                        return ListTile(
                          contentPadding: const EdgeInsets.only(
                              right: 0, left: 10, bottom: 10),
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
                  ReorderableListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        key: Key("$index"),
                        contentPadding: const EdgeInsets.only(
                            right: 0, left: 10, bottom: 10),
                        leading: const Icon(Icons.check_circle_outline),
                        title: Text(
                          "How did you hear about this event?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          "Radio Button",
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
                    itemCount: 4,
                    onReorder: (oldIndex, newIndex) {},
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: OutlinedButton.icon(
              onPressed: () {
                showModalBottomSheet(
                  useRootNavigator: true,
                  showDragHandle: true,
                   context: context,
                  builder: (context) {
                    return SizedBox(
                        child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: formItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
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
    );
  }
}