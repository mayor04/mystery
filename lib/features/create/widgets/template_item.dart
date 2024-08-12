import 'package:flutter/material.dart';
import 'package:mystery/app/models/story_model.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class TemplateItem extends StatelessWidget {
  const TemplateItem({
    required this.model,
    this.onTap,
    super.key,
  });

  final StoryModel model;
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
                color: Color(0xFFD9D9D9),
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
                      model.title,
                      textAlign: TextAlign.center,
                      style: AppFonts.bodyLarge(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.summary,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: AppFonts.bodyXS(color: AppColors.blue200),
                    ),
                    const SizedBox(height: 21),
                    Wrap(
                      spacing: 10,
                      runSpacing: 4,
                      alignment: WrapAlignment.center,
                      children: [
                        for (final genre in model.genres)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 4,
                                width: 4,
                                decoration: const BoxDecoration(
                                  color: AppColors.blue50,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                genre,
                                style: AppFonts.bodyXS().copyWith(
                                  color: AppColors.blue50,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
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
