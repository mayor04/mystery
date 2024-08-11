import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppFonts.headline2().copyWith(
            color: AppColors.blue50,
          ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: AppFonts.bodyMedium().copyWith(
                color: AppColors.blue50,
              ),
            ),
          ),
      ],
    );
  }
}
