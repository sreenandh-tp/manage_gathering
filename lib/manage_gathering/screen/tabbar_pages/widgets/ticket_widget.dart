import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/ticket_edit_page.dart';

class TickectWidget extends StatelessWidget {
  final Widget? rowWidget;
  final String ticketType;
  final String ticketPrice;
  final String? strickedPrice;
  final String seatCount;
  final String status;

  const TickectWidget({
    super.key,
    this.rowWidget,
    required this.ticketType,
    required this.ticketPrice,
    this.strickedPrice,
    required this.seatCount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card.outlined(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            ticketType,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          status,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.merge(const TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
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
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                children: [
                  Text(
                    "₹ $ticketPrice",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    strickedPrice!,
                    style: Theme.of(context).textTheme.labelLarge?.merge(
                        const TextStyle(
                            decoration: TextDecoration.lineThrough)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                children: [
                  Text(
                    "$seatCount Tickets",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(width: 15),
                  Text("₹1500 Sales",
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            rowWidget ??
                const SizedBox(
                  height: 15,
                )
          ],
        ),
      ),
    );
  }
}
