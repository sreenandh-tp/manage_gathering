import 'package:flutter/material.dart';

class SendMessagePage extends StatelessWidget {
  const SendMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("New Massage"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: const EdgeInsets.only(left: 15, right: 15),
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.titleMedium,
              minLines: 1,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  hintText: 'Massage title',
                  label: const Text("Title"),
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                  border: const UnderlineInputBorder(
                      // borderSide: BorderSide.none,
                      )),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              style: Theme.of(context).textTheme.titleMedium,
              minLines: 3,
              maxLines: 50,
              decoration: InputDecoration(
                  label: const Text("Message Content"),
                  hintText: 'Enter message content',
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  border: const UnderlineInputBorder(
                      // borderSide: BorderSide.none,
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    size: 18,
                  ),
                  label: const Text("Send"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
