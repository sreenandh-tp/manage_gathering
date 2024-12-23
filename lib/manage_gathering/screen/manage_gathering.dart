import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering_options/invite_guest_page.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering_options/send_notification_page.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/settings_page.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/ticket_page.dart';
import 'package:manage_gathering/manage_gathering/screen/widgets/gathering_status_row.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/guests_page.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/organizer_page.dart';

class ManageGatheringPage extends StatefulWidget {
  const ManageGatheringPage({super.key});

  @override
  State<ManageGatheringPage> createState() => _ManageGatheringPageState();
}

class _ManageGatheringPageState extends State<ManageGatheringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ));
            },
            icon: const Icon(Icons.settings),
          ),
          PopupMenuButton(
            color: Theme.of(context).primaryColor,
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const EditPage(),
                  //     ));
                },
                child: const Text(
                  "Edit",
                  // style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const ViewOrderPage(),
                  //     ));
                },
                child: const Text(
                  "View order",
                  // style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendNotificationPage(),
                      ));
                },
                child: const Text(
                  "Send a Notification",
                  // style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InviteGuestPage(),
                      ));
                },
                child: const Text(
                  "Invite guest",
                  // style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 18, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "asset/event.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Join me for a delectable evening!",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 5),
                            Text("Starbucks , Trivandrum",
                                style: Theme.of(context).textTheme.titleSmall),
                            Text("30 May 2024 at 9:00 PM",
                                style: Theme.of(context).textTheme.titleSmall)
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GatheringLikesRow(
                        count: "25/100",
                        gatheringStatus: "Going",
                      ),
                      SizedBox(width: 30),
                      GatheringLikesRow(
                        count: "120",
                        gatheringStatus: "Likes",
                      ),
                      SizedBox(width: 30),
                      GatheringLikesRow(
                        count: "₹1500",
                        gatheringStatus: "Sales",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: double.infinity,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                        tabAlignment: TabAlignment.fill,

                        // isScrollable: true,
                        indicatorColor: Colors.deepPurple,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3,
                        labelColor: Colors.deepPurple,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.labelLarge,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.merge(
                                const TextStyle(fontWeight: FontWeight.w700)),
                        tabs: const [
                          Tab(
                            text: "Guests",
                          ),
                          Tab(
                            text: "Organizer",
                          ),
                          Tab(
                            text: "Ticket",
                          ),
                        ]),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          GuestsPage(),
                          OrganizerPage(),
                          TicketPage(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
