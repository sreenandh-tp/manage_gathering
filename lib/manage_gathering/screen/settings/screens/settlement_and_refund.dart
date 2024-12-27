import 'package:flutter/material.dart';

class SettlementAndRefundPage extends StatelessWidget {
  SettlementAndRefundPage({super.key});

  final ValueNotifier<int> selectedRadioNatifier = ValueNotifier(0);

  final List<String> radioItems = [
    "Non-Refundable",
    "100% Refundable",
    "Refund Timeline Rules",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Settlement and Refund"),
      ),
      body: ListView(
        children: [
          ValueListenableBuilder(
              valueListenable: selectedRadioNatifier,
              builder:
                  (BuildContext context, int selectedValue, Widget? child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: radioItems.length,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      title: Text(
                        radioItems[index],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      value: index,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        selectedRadioNatifier.value = value!;
                      },
                    );
                  },
                );
              }),
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
