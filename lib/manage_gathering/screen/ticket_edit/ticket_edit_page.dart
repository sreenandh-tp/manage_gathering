import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
            children: [
              const TicketTextFieldWidget(
                labelText: "Ticket Name",
                hintText: "Enter your ticket name",
                textInputType: TextInputType.name,
              ),
              TicketTextFieldWidget(
                labelText: "Number of tickets",
                hintText: "0",
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                textInputType: TextInputType.number,
              ),
              TicketTextFieldWidget(
                labelText: "Max tickets allowed per user",
                hintText: "0",
                helpText:
                    "Specify the maximum number of tickets a user can purchase.",
                textInputType: TextInputType.number,
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
              // PRICE & GST FIELD
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: TicketTextFieldWidget(
                        labelText: "Price",
                        hintText: "0.00",
                        textInputType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
              ValueListenableBuilder(
                  valueListenable: isCheckedNotifier,
                  builder: (BuildContext context, dynamic newCheckedValue,
                      Widget? child) {
                    return ListTile(
                      contentPadding: const EdgeInsets.only(left: 0),
                      horizontalTitleGap: 5,
                      dense: true,
                      onTap: () {
                        isChecked();
                      },
                      leading: Checkbox(
                        value: isCheckedNotifier.value,
                        onChanged: (value) {
                          isChecked();
                        },
                      ),
                      title: Text(
                        "Apply Discount",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    );
                  }),
              ValueListenableBuilder(
                valueListenable: isCheckedNotifier,
                builder: (BuildContext context, dynamic, Widget? child) {
                  return Visibility(
                    visible: isCheckedNotifier.value,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter valid amount";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Discount amount",
                          // labelStyle: Theme.of(context).textTheme.labelLarge,
                          hintText: "Discount amount (INR)",
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.percent)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.currency_rupee)),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              ValueListenableBuilder(
                  valueListenable: isCheckedNotifier,
                  builder: (BuildContext context, dynamic, Widget? child) {
                    return Visibility(
                      visible: isCheckedNotifier.value,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, bottom: 10),
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
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 18,
                                  ),
                                ),
                                hintText: "DD/MM/YYYY",
                                labelText: "Start on",
                                isDense: true,
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
                                isDense: true,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 18,
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  }),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Pass information",
                    hintText: "Enter your short information",
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
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
      ),
    );
  }
}
