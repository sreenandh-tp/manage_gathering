import 'package:flutter/material.dart';

class GatheringVisibilityPage extends StatelessWidget {
  GatheringVisibilityPage({super.key});

  final List<String> radioItems = [
    "Before Event Start",
    "After Event Start",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Gathering Visibility"),
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: radioItems.length,
            itemBuilder: (context, index) {
              return RadioListTile(
                title: Text(
                  radioItems[index],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                value: index,
                groupValue: true,
                onChanged: (value) {},
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: const Text("Apply"),
            ),
          ),
        ),
      ),
    );
  }
}
