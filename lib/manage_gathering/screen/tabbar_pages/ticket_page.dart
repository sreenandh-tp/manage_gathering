import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/widgets/ticket_widget.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/ticket_edit_page.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isCheckedNotifier = ValueNotifier(false);

    void isChecked() {
      isCheckedNotifier.value = !isCheckedNotifier.value;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            TickectWidget(
              ticketType: "Free Pass",
              ticketPrice: "00.00",
              seatCount: "25/50",
              status: "",
              strickedPrice: "",
              rowWidget: ValueListenableBuilder(
                  valueListenable: isCheckedNotifier,
                  builder: (BuildContext context, dynamic newCheckedValue,
                      Widget? child) {
                    return ListTile(
                      onTap: () {
                        isChecked();
                      },
                      contentPadding: const EdgeInsets.only(left: 0),
                      horizontalTitleGap: 5,
                      leading: Checkbox(
                        value: isCheckedNotifier.value,
                        onChanged: (value) {
                          isChecked();
                        },
                      ),
                      title: Text(
                        "Guest required approval for joining",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    );
                  }),
            ),
            const TickectWidget(
              ticketType: "Golden Pass",
              ticketPrice: "450.00",
              seatCount: "30/30",
              strickedPrice: "₹ 500.0",
              status: " (Sold out)",
              rowWidget: null,
            ),
            const TickectWidget(
              ticketType: "Diamond Pass",
              ticketPrice: "999.00",
              seatCount: "22/30",
              strickedPrice: "",
              status: "",
              rowWidget: null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TicketEditPage(),
                        ));
                  },
                  label: const Text(
                    "Create Ticket",
                  ),
                  icon: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
