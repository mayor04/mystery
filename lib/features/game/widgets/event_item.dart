import 'package:flutter/material.dart';
import 'package:mystery/utils/app_fonts.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

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
                  Text(
                    'Meet with Richard’s family',
                    style: AppFonts.bodyMedium(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Summary of the eventolutpat cursus sit quis nulla sed. Malesuada lectus placerat duis tortor. Interdum massa facilisis porttitor posuere a et. Dictum semper sapien amet amet id pulvinar. Pellentesque vitae quis dui eros tellus magna id. Elit ',
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
