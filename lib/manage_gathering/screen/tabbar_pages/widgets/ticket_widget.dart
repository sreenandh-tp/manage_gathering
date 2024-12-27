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
    return Card(
      child: Column(
        children: [
          ListTile(
            dense: true,
            enabled: true,
            title: Wrap(
              children: [
                Text(
                  ticketType,
                  softWrap: true,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  status,
                  style: Theme.of(context).textTheme.titleSmall?.merge(
                        const TextStyle(color: Colors.red),
                      ),
                ),
              ],
            ),
            trailing: IconButton(
                padding: const EdgeInsets.only(right: 0, top: 10),
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
                  strickedPrice!,
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
          rowWidget ??
              const SizedBox(
                height: 15,
              ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       TextButton.icon(
          //           onPressed: () {
          //             showDialog(
          //               context: context,
          //               builder: (context) {
          //                 return AlertDialog(
          //                   title: Text(
          //                     "Remove",
          //                     style: Theme.of(context).textTheme.titleMedium,
          //                   ),
          //                   content: Text(
          //                     "Are you sure you want to remove this ticket?",
          //                     style: Theme.of(context).textTheme.titleSmall,
          //                   ),
          //                   actions: [
          //                     TextButton(
          //                         onPressed: () {
          //                           Navigator.pop(context);
          //                         },
          //                         child: const Text("Cancel")),
          //                     TextButton(
          //                         onPressed: () {}, child: const Text("Remove"))
          //                   ],
          //                 );
          //               },
          //             );
          //           },
          //           label: const Text("Remove")),

          //       // switch button
          //       Row(
          //         children: [
          //           Text(
          //             "Stop Selling",
          //             style: Theme.of(context).textTheme.labelMedium,
          //           ),
          //           Switch(
          //             value: false,
          //             onChanged: (value) {},
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
