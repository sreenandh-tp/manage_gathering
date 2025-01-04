import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/widgets/ticket_widget.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/ticket_edit_page.dart';

class TicketPage extends StatelessWidget {
  final ScrollController scrollController;
  const TicketPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isCheckedNotifier = ValueNotifier(false);

    void isChecked() {
      isCheckedNotifier.value = !isCheckedNotifier.value;
    }

    final ValueNotifier<bool> isConformedNotifier = ValueNotifier(false);

    void isConform() {
      isConformedNotifier.value = !isConformedNotifier.value;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        controller: scrollController,
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return TickectWidget(
                ticketType: "Free Pass",
                ticketPrice: "00.0",
                seatCount: "25/50",
                status: "Sold Out",
                strickedPrice: "25.0",
                rowWidget: ValueListenableBuilder(
                    valueListenable: isCheckedNotifier,
                    builder: (BuildContext context, dynamic newCheckedValue,
                        Widget? child) {
                      return ListTile(
                        onTap: () {
                          isChecked();
                        },
                        contentPadding: const EdgeInsets.only(left: 0),
                        horizontalTitleGap: 5,
                        leading: Checkbox(
                          value: isCheckedNotifier.value,
                          onChanged: (value) {
                            isChecked();
                          },
                        ),
                        title: Text(
                          "Guest required approval for joining",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      );
                    }),
                removeAndStopSellingButton: ListTile(
                  contentPadding: const EdgeInsets.only(left: 0, right: 10),
                  leading: TextButton.icon(
                      onPressed: () {
                        ticketRemoveSheet(
                            context, isConformedNotifier, isConform);
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 18,
                      ),
                      label: const Text("Remove")),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Stop Selling",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TicketEditPage(),
                      ));
                },
                label: const Text(
                  "Create Ticket",
                ),
                icon: const Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> ticketRemoveSheet(BuildContext context,
      ValueNotifier<bool> isConformedNotifier, void Function() isConform) {
    return showModalBottomSheet(
      useRootNavigator: true,
      showDragHandle: true,
      scrollControlDisabledMaxHeightRatio: 0.6,
      context: context,
      builder: (context) {
        return ValueListenableBuilder(
            valueListenable: isConformedNotifier,
            builder: (BuildContext context, bool newValue, Widget? child) {
              return SizedBox(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: Text(
                        "Remove Ticket",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Text(
                        "Are you sure you want to remove this ticket for ever?",
                        style: Theme.of(context).textTheme.titleMedium,
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
                        value: isConformedNotifier.value,
                        onChanged: (value) {
                          isConform();
                        },
                      ),
                      title: Text(
                        "Conform that you agree for this",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 15),
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
                            opacity: isConformedNotifier.value ? 1.0 : 0.3,
                            duration: const Duration(milliseconds: 300),
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
  }
}
