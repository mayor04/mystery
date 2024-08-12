import 'package:flutter/material.dart';
import 'package:mystery/app/models/story_detail_model.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class EventSelectionItem extends StatelessWidget {
  const EventSelectionItem({
    super.key,
    this.onTap,
    required this.event,
  });

  final VoidCallback? onTap;
  final StoryEventModel event;

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
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.title,
                      textAlign: TextAlign.center,
                      style: AppFonts.bodyLarge(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        event.intro,
                        textAlign: TextAlign.center,
                        style: AppFonts.bodyXS(color: AppColors.blue200),
                      ),
                    ),
                    // const SizedBox(height: 14),
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
