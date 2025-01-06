import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/function/show_dialoge.dart';

class AcceptOrRejectButton extends StatelessWidget {
  const AcceptOrRejectButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 34,
          width: 34,
          child: IconButton.outlined(
            padding: const EdgeInsets.all(0),
            color: Theme.of(context).textTheme.labelMedium?.color,
            onPressed: () {
              ShowDialoge().showDialoge(
                  "Reject?",
                  "Are you sure you want to reject this joining request?",
                  context,
                  TextButton(onPressed: () {}, child: const Text("Reject")));
            },
            icon: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 34,
          width: 34,
          child: IconButton.filled(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                Icons.check,
                size: 18,
                color: Theme.of(context).primaryColor,
              )),
        )
      ],
    );
  }
}
