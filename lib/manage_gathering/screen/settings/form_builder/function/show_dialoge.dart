import 'package:flutter/material.dart';

class ShowDialoge {
  void showDialoge(
      String title, String content, BuildContext ctx, Widget delete) async {
    return showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            delete
          ],
        );
      },
    );
  }
}
