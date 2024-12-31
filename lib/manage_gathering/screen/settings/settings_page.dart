import 'package:flutter/material.dart';
import 'package:manage_gathering/core/lists_page.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isConformNotifier = ValueNotifier(false);

    void isConform() {
      isConformNotifier.value = !isConformNotifier.value;
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageGatheringPage(),
                ));
          },
        ),
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: settingsItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pagesRoute[index],
                      ),
                    );
                  },
                  leading: icons[index],
                  title: Text(
                    settingsItems[index],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              },
            ),
          ),
          ListTile(
            onTap: () {
              showModalBottomSheet(
                useRootNavigator: true,
                showDragHandle: true,
                scrollControlDisabledMaxHeightRatio: 0.6,
                context: context,
                builder: (context) {
                  return ValueListenableBuilder(
                      valueListenable: isConformNotifier,
                      builder:
                          (BuildContext context, bool newValue, Widget? child) {
                        return SizedBox(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10),
                                child: Text(
                                  "Cancel Gathering",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Text(
                                  "Are you sure you want to caancel this gathring for ever?",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                horizontalTitleGap: 5,
                                contentPadding:
                                    const EdgeInsets.only(left: 0, bottom: 15),
                                onTap: () {
                                  isConform();
                                },
                                leading: Checkbox(
                                  value: isConformNotifier.value,
                                  onChanged: (value) {
                                    isConform();
                                  },
                                ),
                                title: Text(
                                  "Conform that you agree this",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                    const SizedBox(width: 15),
                                    AnimatedOpacity(
                                      opacity:
                                          isConformNotifier.value ? 1.0 : 0.3,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: FilledButton(
                                        onPressed: () {},
                                        child: const Text("Conform"),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
              );
            },
            leading: const Icon(Icons.cancel_outlined),
            title: Text(
              "Cancel Gathering",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
