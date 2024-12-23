import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/add_organizer/add_organizer_page.dart';

class OrganizerPage extends StatelessWidget {
  const OrganizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("asset/dummyperson.png"),
              ),
              title: Row(
                children: [
                  Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "@john_Doe",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              subtitle: Text(
                "Host",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: PopupMenuButton(
                color: Theme.of(context).primaryColor,
                icon: const Icon(Icons.more_horiz_outlined),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(
                      "Edit",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Remove",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Call",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddOrganizerPage(),
                      ));
                },
                label: const Text(
                  "Add Oraganizer",
                ),
                icon: const Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.deepPurple,
                ),
              )),
        ),
      ],
    );
  }
}
