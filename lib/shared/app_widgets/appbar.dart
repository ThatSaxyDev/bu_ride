import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/myicon.dart';
import 'package:bu_ride/shared/utils/nav.dart';
import "package:bu_ride/theme/palette.dart";
import 'package:flutter/material.dart';

AppBar customAppBar(
  String title, {
  bool isLeftAligned = false,
  double? fontSize,
  FontWeight? fontWeight,
  List<Widget>? actions,
  Widget? bottom,
  Color? color,
  Color? iconColor,
  bool showCustomIcon = false,
  Color? foregroundColor,
  double? leadingWidth,
  bool automaticallyImplyLeading = true,
  bool overrideAction = false,
  void Function()? doThisInstead,
  required BuildContext context,
}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    foregroundColor: foregroundColor ?? neutralBlack,
    backgroundColor: color ?? neutralWhite,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: switch (automaticallyImplyLeading) {
      true => showCustomIcon
          ? Padding(
              padding: const EdgeInsets.only(left: 25),
              child: MyIcon(
                color: blueColor,
                onTap: () {
                  if (overrideAction) {
                    doThisInstead!.call();
                  } else {
                    goBack(context);
                  }
                },
                icon: 'arrowBack',
              ),
            )
          : null,
      false => null,
    },
    elevation: 0,
    centerTitle: !isLeftAligned,
    leadingWidth: leadingWidth ?? 50,
    title: Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: grey900,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    ),
    actions: actions ?? const [SizedBox.shrink()],
    bottom: bottom == null
        ? null
        : PreferredSize(
            preferredSize: const Size(327, 60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: bottom,
            )),
  );
}
