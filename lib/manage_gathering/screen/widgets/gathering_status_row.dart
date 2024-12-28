import 'package:flutter/material.dart';

class GatheringLikesRow extends StatelessWidget {
  final String count;
  final String gatheringStatus;
  const GatheringLikesRow({
    super.key,
    required this.count,
    required this.gatheringStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(count, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: 4),
        Text(gatheringStatus, style: Theme.of(context).textTheme.labelLarge)
      ],
    );
  }
}
