import 'package:flutter/material.dart';

class RemovingBottomSheet {
  void removingBottumSheet(
      BuildContext context,
      String title,
      String content,
      Widget listTieleading,
      String listTileText,
      GestureTapCallback listTileOnTap,
      Widget button) async {
    return showModalBottomSheet(
      useRootNavigator: true,
      showDragHandle: true,
      scrollControlDisabledMaxHeightRatio: 0.6,
      context: context,
      builder: (context) {
        return SizedBox(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListTile(
                dense: true,
                horizontalTitleGap: 5,
                contentPadding: const EdgeInsets.only(left: 0, bottom: 15),
                onTap: listTileOnTap,
                leading: listTieleading,
                title: Text(
                  listTileText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    const SizedBox(width: 15),
                    button
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
