import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class TemplateItem extends StatelessWidget {
  const TemplateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: AppColors.blue50,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 257,
            width: 256,
            decoration: const BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            'A Galactic Rendezvous',
            style: AppFonts.bodyLarge(),
          ),
        ],
      ),
    );
  }
}
