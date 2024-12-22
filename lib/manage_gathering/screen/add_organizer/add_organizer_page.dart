import 'package:flutter/material.dart';

class AddOrganizerPage extends StatelessWidget {
  const AddOrganizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text(
          "Add Organizer",
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
            const SizedBox(height: 15),
            Text(
              "Role",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Chip(
                  label: Text(
                    "Co-host",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    "Crew",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        height: 65,
        color: const Color.fromARGB(255, 255, 248, 248),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            child: const Text("Add"),
          ),
        ),
      ),
    );
  }
}
