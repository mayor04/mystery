import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class GameHeader extends StatelessWidget {
  const GameHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28,
            padding: const EdgeInsets.symmetric(horizontal: 11),
            decoration: BoxDecoration(
              color: const Color(0xFF293253),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: const Color(0xFF000000),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add),
                Text(
                  'All Events',
                  style: AppFonts.bodyXS().copyWith(
                    color: AppColors.textBeige,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 26,
            padding: const EdgeInsets.symmetric(horizontal: 11),
            decoration: const BoxDecoration(
              color: Color(0xFF532E29),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add),
                Text(
                  '200',
                  style: AppFonts.bodyXS().copyWith(
                    color: AppColors.textBeige,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Container(
            height: 26,
            width: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF293253),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: const Color(0xFF000000),
              ),
            ),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
