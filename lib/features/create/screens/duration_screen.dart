import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';
import 'package:mystery/widgets/multi_filter_chip.dart';
import 'package:mystery/widgets/page_title.dart';

class DurationScreen extends StatelessWidget {
  const DurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const SizedBox(height: 90),
          const PageTitle(
            title: 'Duration',
            subtitle: 'How long do you want to play this game?',
          ),
          const SizedBox(height: 20),
          Text(
            'Select at least one (1)',
            style: AppFonts.bodySmall(
              color: AppColors.blue50,
            ),
          ),
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
