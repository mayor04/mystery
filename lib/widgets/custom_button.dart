import 'package:flutter/material.dart';
import 'package:mystery/constant/colors.dart';
import 'package:mystery/utils/app_fonts.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    this.text,
    this.child,
    this.onPressed,
    super.key,
  }) : border = false;

  const AppButton.border({
    this.text,
    this.child,
    this.onPressed,
    super.key,
  }) : border = true;

  final String? text;
  final Widget? child;
  final bool border;
  final VoidCallback? onPressed;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: 225,
        padding: const EdgeInsets.symmetric(vertical: 11),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.border ? null : AppColors.blue50,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: widget.border
              ? Border.all(
                  color: const Color(0xFFABB4BC),
                )
              : null,
        ),
        child: widget.child ??
            Text(
              widget.text ?? '',
              style: AppFonts.bodyMedium().copyWith(
                color: widget.border ? const Color(0xFFABB4BC) : AppColors.blue700,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
    );
  }
}
