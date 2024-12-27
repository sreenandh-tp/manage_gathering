import 'package:flutter/material.dart';

class SendMessagePage extends StatelessWidget {
  const SendMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text("Send Massages"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: TextFormField(
              style: Theme.of(context).textTheme.titleMedium,
              minLines: 1,
              maxLines: 3,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  hintText: 'Message title',
                  hintStyle: Theme.of(context).textTheme.titleMedium,
                  border: const UnderlineInputBorder(
                      // borderSide: BorderSide.none,
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              style: Theme.of(context).textTheme.titleMedium,
              minLines: 1,
              maxLines: 50,
              decoration: InputDecoration(
                  hintText: 'Message Content',
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  border: const UnderlineInputBorder(
                      // borderSide: BorderSide.none,
                      )),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Send"),
            ),
          ),
        ],
      ),
    );
  }
}
