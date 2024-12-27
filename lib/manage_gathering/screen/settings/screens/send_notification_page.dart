import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/screens/send_message_page.dart';

class SendNotificationPage extends StatelessWidget {
  const SendNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("Send Notifications"),
        actions: [
          FilledButton.icon(
            onPressed: () {},
            label: const Text("Sent Chat"),
          )
        ],
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                leading: const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),
                title: Text("Message title",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle: Text("Message content",
                    style: Theme.of(context).textTheme.titleSmall),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "11:00 PM",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SendMessagePage(),
              ));
        },
        label: const Text("Start Chat"),
        icon: const Icon(
          Icons.message,
          size: 18,
        ),
      ),
    );
  }
}
