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
                icon: const Icon(Icons.more_horiz_outlined),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text("Edit"),
                  ),
                  const PopupMenuItem(
                    child: Text("Remove"),
                  ),
                  const PopupMenuItem(
                    child: Text("Call"),
                  ),
                ],
              ),
            );
          },
        ),
        TextButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddOrganizerPage(),
                  ));
            },
            icon: const Icon(Icons.add),
            label: const Text(
              'Add organizer',
              // style: Theme.of(context).textTheme.titleSmall,
            ))
      ],
    );
  }
}
