import 'package:flutter/material.dart';
import 'package:mystery/widgets/multi_filter_chip.dart';

class DurationScreen extends StatelessWidget {
  const DurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Story Unfolds'),
          const SizedBox(height: 10),
          const Text(
            'We’ve got some options for you to choose '
            'as foundation for your story',
          ),
          const SizedBox(height: 10),
          const Text('Select at least one (1)'),
          const SizedBox(height: 67),
          MultiFilterChip(
            filters: const [
              '5-10 minutes',
              '10-15 minutes',
              '15-20 minutes',
              '20-30 minutes',
              '1- 2 hours',
            ],
            onSelected: (v) {},
          ),
        ],
      ),
    );
  }
}
