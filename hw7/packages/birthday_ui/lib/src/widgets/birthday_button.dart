import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class BirthdayButton extends StatelessWidget {
  const BirthdayButton({
    required this.title,
    super.key,
    this.onTap,
    this.leading,
  });

  final String title;
  final void Function()? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kOrangeColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BirthdayText.custom(
              title,
              bodyStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
