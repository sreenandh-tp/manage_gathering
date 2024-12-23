import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/widgets/tickect_textfield_widget.dart';

class TicketEditPage extends StatelessWidget {
  const TicketEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> ticketValidation = GlobalKey<FormState>();

    var dropDownItems = ["10%", "20%", "30%", "40%", "50%"];

    final ValueNotifier<bool> isCheckedNotifier = ValueNotifier(false);

    void isChecked() {
      isCheckedNotifier.value = !isCheckedNotifier.value;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text(
          "Edit pass",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Form(
        key: ticketValidation,
        child: ListView(
          itemExtent: 68,
          children: [
            const TicketTextFieldWidget(
              labelText: "Ticket Name",
              hintText: "Enter your ticket name",
            ),
            const TicketTextFieldWidget(
              labelText: "Number of tickets",
              hintText: "0",
            ),
            const TicketTextFieldWidget(
              labelText: "Max tickets allowed per user",
              hintText: "0",
              helpText:
                  "Specify the maximum number of tickets a user can purchase.",
            ),
            // PRICE & GST FIELD
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: TicketTextFieldWidget(
                      labelText: "Price",
                      hintText: "0.00",
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButtonFormField(
                        dropdownColor: Theme.of(context).primaryColor,
                        hint: const Text(
                          "GST %",
                          // style: Theme.of(context).textTheme.labelMedium,
                        ),
                        validator: (value) {
                          if (value != null) {
                            return null;
                          } else {
                            return "Pick a discount";
                          }
                        },
                        items: dropDownItems.map(
                          (e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {},
                      ),
                    )),
              ],
            ),
            // apply discount check box
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: isCheckedNotifier,
                    builder: (BuildContext context, dynamic newCheckedValue,
                        Widget? child) {
                      return Checkbox(
                        value: isCheckedNotifier.value,
                        onChanged: (value) {
                          isChecked();
                        },
                      );
                    }),
                Text(
                  "Apply Discount",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: isCheckedNotifier,
                builder: (BuildContext context, dynamic, Widget? child) {
                  return Visibility(
                    visible: isCheckedNotifier.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter valid amount";
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: "Discount amount",
                          // labelStyle: Theme.of(context).textTheme.labelLarge,
                          hintText: "Discount amount (INR)",
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.percent),
                              SizedBox(width: 30),
                              Icon(
                                Icons.currency_rupee,
                                color: Colors.indigo,
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),

            ValueListenableBuilder(
                valueListenable: isCheckedNotifier,
                builder: (BuildContext context, dynamic, Widget? child) {
                  return Visibility(
                    visible: isCheckedNotifier.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              }
                              return "Enter valid time";
                            },
                            showCursor: false,
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              hintText: "DD/MM/YYYY",
                              labelText: "Start on",
                              labelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              suffix: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_today_outlined),
                              ),
                            ),
                          )),
                          const SizedBox(width: 20),
                          Expanded(
                              child: TextFormField(
                            showCursor: false,
                            keyboardType: TextInputType.none,
                            decoration: InputDecoration(
                              hintText: "DD/MM/YYYY",
                              labelText: "End on (Optional)",
                              labelStyle:
                                  Theme.of(context).textTheme.labelLarge,
                              suffix: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.calendar_today_outlined),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                if (ticketValidation.currentState!.validate()) {}
              },
              child: const Text("Create"),
            ),
          ),
        ),
      ),
    );
  }
}
