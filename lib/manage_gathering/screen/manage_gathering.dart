import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering_options/invite_guest_page.dart';
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
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<double> scrollNotifier = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    scrollNotifier.value = scrollController.offset;
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollNotifier.dispose();
    super.dispose();
  }

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
                child: Text(
                  "Edit",
                  style: Theme.of(context).textTheme.labelMedium,
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
                child: Text(
                  "View order",
                  style: Theme.of(context).textTheme.labelMedium,
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
                child: Text(
                  "Invite guest",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (BuildContext ctx, dynamic newValue, Widget? _) {
                return Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.linearToEaseOut,
                                height: newValue < 50 ? 80 : 45,
                                width: newValue < 50 ? 80 : 45,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Join me for a delectable evening!",
                                      maxLines: newValue < 60 ? 2 : 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    newValue < 50
                                        ? Text("Starbucks , Trivandrum",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                        : const SizedBox(),
                                    Text("30 May 2024 at 9:00 PM",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        newValue < 50
                            ? const Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GatheringLikesRow(
                                      count: "25/100",
                                      gatheringStatus: "Going",
                                    ),
                                    GatheringLikesRow(
                                      count: "120",
                                      gatheringStatus: "Likes",
                                    ),
                                    GatheringLikesRow(
                                      count: "₹1500",
                                      gatheringStatus: "Sales",
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                );
              }),
          ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (BuildContext ctx, double secondValue, Widget? _) {
                return secondValue < 50
                    ? const SizedBox(height: 4)
                    : const SizedBox(height: 2);
              }),
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
                    ValueListenableBuilder(
                        valueListenable: scrollNotifier,
                        builder: (context, thirdValue, child) {
                          return Expanded(
                            child: TabBarView(
                              children: [
                                GuestsPage(scrollController: scrollController),
                                OrganizerPage(
                                    scrollController: scrollController),
                                TicketPage(scrollController: scrollController),
                              ],
                            ),
                          );
                        })
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
