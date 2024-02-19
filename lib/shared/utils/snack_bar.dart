// import 'package:file_picker/file_picker.dart';
// import 'package:connect/shared/nee_extensions.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void showBanner({
  required BuildContext context,
  required String theMessage,
  required NotificationType theType,
}) {
  Flushbar(
    message: theMessage,
    messageSize: 15,
    duration: const Duration(seconds: 4),
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    borderRadius: BorderRadius.circular(7),
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.linearToEaseOut,
    messageColor: Colors.white,
    icon: Icon(
      theType == NotificationType.failure
          ? PhosphorIcons.warning(PhosphorIconsStyle.bold)
          : theType == NotificationType.success
              ? PhosphorIcons.checks(PhosphorIconsStyle.bold)
              : PhosphorIcons.warningCircle(PhosphorIconsStyle.bold),
      color: Colors.white,
    ),
    backgroundColor: theType == NotificationType.failure
        ? error500
        : theType == NotificationType.success
            ? success400
            : warning500,
  ).show(context);
}
