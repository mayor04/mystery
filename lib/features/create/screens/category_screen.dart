import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';
import 'package:mystery/widgets/multi_filter_chip.dart';
import 'package:mystery/widgets/page_title.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 90),
          const PageTitle(
            title: 'Select Category',
            subtitle: 'We’ve got some options for you to choose '
                'as foundation for your story',
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
