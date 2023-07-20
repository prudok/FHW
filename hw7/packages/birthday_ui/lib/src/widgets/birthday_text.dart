import 'package:birthday_ui/src/shared/colors.dart';
import 'package:birthday_ui/src/shared/styles.dart';
import 'package:flutter/material.dart';

class BirthdayText extends StatelessWidget {
  BirthdayText.headingOne(this.text, {super.key}) : style = heading1Style;

  BirthdayText.headingTwo(this.text, {super.key}) : style = heading2Style;

  const BirthdayText.custom(this.text, this.style, {super.key});

  BirthdayText.body(
    this.text, {
    super.key,
    Color color = kMediumGreyColor,
  }) : style = bodyStyle.copyWith(color: color);

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
