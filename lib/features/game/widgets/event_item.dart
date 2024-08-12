import 'package:flutter/material.dart';
import 'package:mystery/app/models/story_detail_model.dart';
import 'package:mystery/utils/app_fonts.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.onTap,
    required this.event,
  });

  final VoidCallback onTap;
  final StoryEventModel event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 343,
        decoration: const BoxDecoration(
          color: Color(0xFF1B1F23),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      event.title,
                      style: AppFonts.bodyMedium(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    event.intro,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.bodySmall(
                      color: const Color(0xFF8C8C8C),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -10,
              right: 10,
              child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
