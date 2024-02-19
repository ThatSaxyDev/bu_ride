// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import "package:bu_ride/theme/palette.dart";

class BButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Color? color;
  final Widget? item;
  final String? text;
  final bool isText;
  final bool isLoading;
  final Color? textColor;
  final Color? borderColor;
  final bool showBorder;
  const BButton({
    Key? key,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.radius,
    required this.onTap,
    this.isLoading = false,
    this.onLongPress,
    this.color,
    this.item,
    this.text,
    this.isText = true,
    this.textColor,
    this.borderColor,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: SizedBox(
        height: height ?? 44,
        width: width ?? 327,
        child: ElevatedButton(
          onPressed: onTap,
          onLongPress: onLongPress,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: showBorder
                    ? (borderColor ?? neutralBlack.withOpacity(0.5))
                    : Colors.transparent,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 20),
              ),
            ),
            padding: EdgeInsets.zero,
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: color ?? primaryBase,
          ),
          child: Center(
            child: isText == true
                ? Text(
                    text ?? '',
                    style: TextStyle(
                      fontSize: fontSize ?? 16,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      color: textColor ?? neutralWhite,
                    ),
                  )
                : item,
          ),
        ),
      ),
    );
  }
}
