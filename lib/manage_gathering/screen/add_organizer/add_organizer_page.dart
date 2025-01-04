import 'package:flutter/material.dart';
import 'package:manage_gathering/core/lists_page.dart';

class AddOrganizerPage extends StatelessWidget {
  const AddOrganizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const CloseButton(),
          title: Text(
            "Add Organizer",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter organizer',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 15),
                child: Text(
                  "Assign Role",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Wrap(
                  spacing: 8,
                  direction: Axis.horizontal,
                  children: [
                    ...List.generate(
                      organisers.length,
                      (index) {
                        return FilterChip(
                          onSelected: (value) {},
                          selected: false,
                          label: Text(
                            organisers[index],
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: BottomAppBar(
          height: 65,
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
