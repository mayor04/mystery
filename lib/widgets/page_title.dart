import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    this.title,
    this.titleWidget,
    this.subtitle,
    super.key,
  });

  final String? title;
  final Widget? titleWidget;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        titleWidget ??
            Text(
              title ?? '',
              style: AppFonts.headline2().copyWith(
                color: AppColors.blue50,
              ),
            ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
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
