import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 0),
            child: Text(
              "Name",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Enter your name"),
            ),
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
                        horizontalTitleGap: 0,
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
            padding:
                const EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 10),
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
      ),
    );
  }
}
