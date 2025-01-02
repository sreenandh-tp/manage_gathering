import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dropDownItems = ["Vegitarian", "non-Veg"];
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("Form title"),
      ),
      body: BlocBuilder<FormBuilderBloc, FormBuilderState>(
        builder: (context, state) {
          log(state.singleLineFormModelList.length.toString());
          return ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.singleLineFormModelList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 5, top: 10),
                        child: Text(
                          state.singleLineFormModelList[index].label,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: state
                                .singleLineFormModelList[index].placeholdertext,
                            helperText:
                                state.singleLineFormModelList[index].helpertext,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              // RADIO BUTTON FIELD
              ...List.generate(
                1,
                (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 5, top: 10, bottom: 10),
                        child: Text(
                          "How did you hear about this event?(Optional)",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ...List.generate(
                        3,
                        (index) {
                          return RadioListTile(
                            contentPadding: const EdgeInsets.only(left: 5),
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                            title: Text("Option${index + 1}"),
                          );
                        },
                      )
                    ],
                  );
                },
              ),
              // CHECK BOX FIELD
              ...List.generate(
                1,
                (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 5, top: 10, bottom: 10),
                        child: Text(
                          "What activities are you intrested in during the event?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ...List.generate(
                        3,
                        (index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.only(left: 5),
                            horizontalTitleGap: 10,
                            leading: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            title: Text("Option${index + 1}"),
                          );
                        },
                      )
                    ],
                  );
                },
              ),
              // DROP DOWN

              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 5, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What is your dietary preference?",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    DropdownButtonFormField(
                      padding: const EdgeInsets.only(right: 15),
                      hint: Text(dropDownItems.first),
                      items: dropDownItems.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {},
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
