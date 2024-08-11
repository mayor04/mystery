import 'package:flutter/material.dart';
import 'package:mystery/widgets/multi_filter_chip.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
              'Action',
              'Adventure',
              'Comedy',
              'Drama',
              'Fantasy',
              'Horror',
              'Mystery',
              'Romance',
              'Sci-Fi',
              'Thriller',
            ],
            onSelected: (v) {},
          ),
        ],
      ),
    );
  }
}
