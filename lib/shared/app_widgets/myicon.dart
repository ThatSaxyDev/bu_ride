// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyIcon extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final double? height;
  final Color? color;

  const MyIcon({
    Key? key,
    required this.icon,
    this.height,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SvgPicture.asset(
        icon.svg,
        // ignore: deprecated_member_use
        color: color,
        height: height ?? 24,
      ),
    );
  }
}

