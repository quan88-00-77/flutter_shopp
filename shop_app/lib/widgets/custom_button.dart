import 'package:flutter/material.dart';

import '../config/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onpressed,
      required this.textColor,
      required this.color,
      this.paddingHori,
      this.paddingVeri,
      this.isBorderRadius = false,
      this.fontSize = 14})
      : super(key: key);
  final String text;
  final VoidCallback onpressed;
  final Color color;
  final Color textColor;
  final double? paddingHori;
  final double? paddingVeri;
  final bool isBorderRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: paddingVeri ?? 10, horizontal: paddingHori ?? 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isBorderRadius ? 0 : 10),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: interStyle.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
              color: textColor),
        ),
      ),
    );
  }
}
