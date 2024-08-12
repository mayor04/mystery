import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class EventSelectionItem extends StatelessWidget {
  const EventSelectionItem({
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 290,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: AppColors.blue50,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Meet with Richard’s family',
                      style: AppFonts.bodyLarge(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Summary of the eventolutpat cursus sit quis nulla sed. Malesuada lectus placerat duis tortor. Interdum massa facilisis porttitor posuere a et. Dictum semper sapien amet amet id pulvinar. Pellentesque vitae quis dui eros tellus magna id. Elit ',
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: AppFonts.bodyXS(color: AppColors.blue200),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
