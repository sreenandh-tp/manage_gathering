import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/bloc/manage_gathering_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering_options/invite_guest_page.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/settings_page.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/ticket_page.dart';
import 'package:manage_gathering/manage_gathering/screen/widgets/gathering_status_row.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/guests_page.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/organiser_page.dart';

class ManageGatheringPage extends StatefulWidget {
  const ManageGatheringPage({super.key});

  @override
  State<ManageGatheringPage> createState() => _ManageGatheringPageState();
}

class _ManageGatheringPageState extends State<ManageGatheringPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    context
        .read<ManageGatheringBloc>()
        .add(ScrollListenerEvent(offsetValue: scrollController.offset));
  }

  @override
  void dispose() {
    scrollController.dispose();
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
          BlocBuilder<ManageGatheringBloc, ManageGatheringState>(
            builder: (context, state) {
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
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.linearToEaseOut,
                              height: state.scrollSize,
                              width: state.scrollSize,
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
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  state.scrollSize >= 65
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
                      state.scrollSize >= 65.0
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
                          : const SizedBox()
                    ],
                  ),
                ),
              );
            },
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
                            text: "Organiser",
                          ),
                          Tab(
                            text: "Ticket",
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(
                        children: [
                          GuestsPage(scrollController: scrollController),
                          OrganiserPage(scrollController: scrollController),
                          TicketPage(scrollController: scrollController),
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
