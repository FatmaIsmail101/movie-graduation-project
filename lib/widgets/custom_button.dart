import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap, super.key,
    required this.text, required this.color,
    this.textColor
  });

  final String text;
  Color color;
  final VoidCallback? onTap;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Bounceable(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Text(
          text,
          style: theme.textTheme.headlineSmall!.copyWith(

              color: textColor
          ),
        ),
      ),
    );
  }
}
