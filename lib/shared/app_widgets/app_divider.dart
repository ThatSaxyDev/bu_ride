// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double? width;
  final double? borderWidth;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  const AppDivider({
    Key? key,
    this.width,
    this.margin,
    this.borderWidth,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 327,
      margin: margin,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: borderWidth ?? 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: color ?? const Color(0xFFEFEFEF),
          ),
        ),
      ),
    );
  }
}
