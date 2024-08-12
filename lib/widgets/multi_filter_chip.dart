import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class MultiFilterChip extends StatelessWidget {
  const MultiFilterChip({
    required this.filters,
    required this.onSelected,
    super.key,
  });

  final List<String> filters;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: filters
          .map(
            (e) => FilterChip(
              label: Text(
                e,
                style: AppFonts.bodyMedium(),
              ),
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              disabledColor: Colors.transparent,
              color: MaterialStateColor.resolveWith((states) => Colors.transparent),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: AppColors.blue200,
                ),
              ),
              onSelected: (v) {
                if (v) {
                  onSelected(e);
                }
              },
            ),
          )
          .toList(),
    );
  }
}
