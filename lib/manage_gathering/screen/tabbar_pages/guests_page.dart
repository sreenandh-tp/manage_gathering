import 'package:flutter/material.dart';
import 'package:manage_gathering/core/lists_page.dart';
import 'package:manage_gathering/manage_gathering/screen/tabbar_pages/widgets/accept_reject_button.dart';

class GuestsPage extends StatefulWidget {
  final ScrollController scrollController;
  const GuestsPage({super.key, required this.scrollController});

  @override
  State<GuestsPage> createState() => _GuestsPageState();
}

class _GuestsPageState extends State<GuestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: widget.scrollController,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10, right: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: guestFiltters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Chip(
                    elevation: 0,
                    label: Text(
                      guestFiltters[index],
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                );
              },
            ),
          ),
          // const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    manageGatheringBottomSheet(context);
                  },
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("asset/dummyperson.png"),
                  ),
                  title: Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Row(
                    children: [
                      Text("10 min ago",
                          style: Theme.of(context).textTheme.labelSmall),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.confirmation_num_outlined,
                        size: 15,
                      ),
                      const SizedBox(width: 4),
                      Text("1 pass",
                          style: Theme.of(context).textTheme.labelSmall)
                    ],
                  ),
                  trailing: const AcceptOrRejectButton(),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.qr_code_scanner_outlined),
          label: const Text("Verify"),
        ),
      ),
    );
  }

  manageGatheringBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      showDragHandle: true,
      scrollControlDisabledMaxHeightRatio: 0.8,
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("asset/dummyperson.png"),
                  ),
                  title: Text(
                    "@John_Doe",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.call)),
                ),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Text("1G****C",
                          style: Theme.of(context).textTheme.titleMedium),
                      trailing: Text("10 min ago",
                          style: Theme.of(context).textTheme.labelSmall),
                    ),
                    ListTile(
                      leading: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.confirmation_num_outlined),
                      ),
                      title: Text(
                        "Free Pass - 2 Nos",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text("Checked-In at 15 Oct 2024,05:00 PM",
                          style: Theme.of(context).textTheme.labelMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17, top: 10),
                      child: Text(
                        "Collected Information",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    ...List.generate(
                      growable: true,
                      2,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 17, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Question number $index?",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "User answer",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 13, right: 13, bottom: 8, top: 8),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text("Verify"),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
