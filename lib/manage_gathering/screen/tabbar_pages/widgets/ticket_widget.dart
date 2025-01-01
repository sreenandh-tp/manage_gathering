import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/ticket_edit_page.dart';

class TickectWidget extends StatelessWidget {
  final Widget? rowWidget;
  final String ticketType;
  final String ticketPrice;
  final String? strickedPrice;
  final String seatCount;
  final String status;
  final Widget removeAndStopSellingButton;

  const TickectWidget(
      {super.key,
      this.rowWidget,
      required this.ticketType,
      required this.ticketPrice,
      this.strickedPrice,
      required this.seatCount,
      required this.status,
      required this.removeAndStopSellingButton});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(
              right: 0,
              left: 15,
            ),
            title: Wrap(
              spacing: 10,
              children: [
                Text(
                  ticketType,
                  softWrap: true,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "($status)",
                  style: Theme.of(context).textTheme.titleSmall?.merge(
                        const TextStyle(color: Colors.red),
                      ),
                ),
              ],
            ),
            trailing: IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TicketEditPage(),
                      ));
                },
                icon: const Icon(
                  Icons.edit_square,
                  size: 18,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Text(
                  "₹ $ticketPrice",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(width: 8),
                Text(
                  "₹ $strickedPrice",
                  style:
                      Theme.of(context).textTheme.labelLarge?.merge(TextStyle(
                            decorationColor:
                                Theme.of(context).textTheme.labelSmall?.color,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 3,
                          )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "$seatCount Tickets",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(width: 15),
                Text("₹1500 Sales",
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: 15),
                Text("20 Check-in",
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
          rowWidget ?? const SizedBox(),
          removeAndStopSellingButton
        ],
      ),
    );
  }
}
