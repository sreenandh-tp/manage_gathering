import 'package:flutter/material.dart';

class CheckBoxTile extends StatelessWidget {
  final bool checkValue;
  final String title;
  final VoidCallback tiltOnTap;
  final ValueChanged<bool?> checkBoxTap;

  const CheckBoxTile({
    super.key,
    required this.checkValue,
    required this.title,
    required this.tiltOnTap,
    required this.checkBoxTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0),
      horizontalTitleGap: 5,
      dense: true,
      onTap: tiltOnTap,
      leading:
          Checkbox(tristate: true, value: checkValue, onChanged: checkBoxTap),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
