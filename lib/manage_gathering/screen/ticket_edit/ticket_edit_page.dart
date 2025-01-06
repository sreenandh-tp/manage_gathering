import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/core/lists_page.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/cubit/ticket_edit_cubit.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/widgets/tickect_textfield_widget.dart';

import 'widgets/date_picker_field.dart';

class TicketEditPage extends StatelessWidget {
  const TicketEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> ticketValidation = GlobalKey<FormState>();

    var dropDownItems = ["10%", "20%", "30%", "40%", "50%"];

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
          child: BlocBuilder<TicketEditCubit, TicketEditState>(
            builder: (context, state) {
              return ListView(
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

                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 0),
                    horizontalTitleGap: 5,
                    dense: true,
                    onTap: () {
                      context.read<TicketEditCubit>().isAllowBulk();
                    },
                    leading: Checkbox(
                      tristate: true,
                      value: state.isAllowBulkBooking,
                      onChanged: (value) {
                        context.read<TicketEditCubit>().isAllowBulk();
                      },
                    ),
                    title: Text(
                      "Allow bulk booking",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TicketTextFieldWidget(
                        labelText: "Min Tickets",
                        hintText: "1",
                        textInputType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )),
                      Expanded(
                          child: TicketTextFieldWidget(
                        labelText: "Max Tickets",
                        hintText: "10",
                        textInputType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      )),
                    ],
                  ),
                  // PRICE & GST FIELD
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: TicketTextFieldWidget(
                            labelText: "Price (INR)",
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
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
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 0),
                    horizontalTitleGap: 5,
                    dense: true,
                    onTap: () {
                      context.read<TicketEditCubit>().isApplyDiscount();
                    },
                    leading: Checkbox(
                      tristate: true,
                      value: state.isApplyDiscount,
                      onChanged: (value) {
                        context.read<TicketEditCubit>().isApplyDiscount();
                      },
                    ),
                    title: Text(
                      "Apply Discount",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Visibility(
                    visible: state.isApplyDiscount,
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
                  ),

                  Visibility(
                    visible: state.isApplyDiscount,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, bottom: 10),
                      child: DatePickerField(
                        startLabelText: "Start on",
                        startDatePicker: () {},
                        endLabelText: "End on (Optional)",
                        endDatePicker: () {},
                      ),
                    ),
                  ),

                  Visibility(
                    visible: state.isApplyDiscount,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      child: DatePickerField(
                        startLabelText: "Sale start",
                        endLabelText: "Sale end",
                        startDatePicker: () {},
                        endDatePicker: () {},
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: "Pass information",
                        hintText: "Enter your short information",
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 0),
                    horizontalTitleGap: 5,
                    dense: true,
                    onTap: () {
                      context.read<TicketEditCubit>().isAgeProofCheck();
                    },
                    leading: Checkbox(
                      tristate: true,
                      value: state.isAgeProofCheck,
                      onChanged: (value) {
                        context.read<TicketEditCubit>().isAgeProofCheck();
                      },
                    ),
                    title: Text(
                      "18+ (Valid age proof ID card required)",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "The guest will bear the platform fee of 5% in addition to the ticket amount",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Text(
                      "Pass cancel & refund option",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ...List.generate(
                    tickectEditFundOption.length,
                    (index) {
                      return RadioListTile(
                        title: Text(
                          tickectEditFundOption[index],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        contentPadding: const EdgeInsets.only(left: 5),
                        value: index,
                        groupValue: state.isRadioSelected,
                        onChanged: (value) {
                          context.read<TicketEditCubit>().isSelectedRadio(value!);
                        },
                      );
                    },
                  )
                ],
              );
            },
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
