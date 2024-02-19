// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bu_ride/theme/palette.dart';

class ClickableUserNameText extends ConsumerWidget {
  final String text;
  final Color textColor;
  final Function(String) onUsernamePressed;
  const ClickableUserNameText({
    super.key,
    required this.text,
    required this.onUsernamePressed,
    this.textColor = neutralWhite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RegExp regex = RegExp(r'\B(@\w+)');
    final matches = regex.allMatches(text);
    final List<TextSpan> spans = [];

    int previousEnd = 0;

    for (var match in matches) {
      final String matchedText = match.group(0)!;
      final int start = match.start;
      final int end = match.end;

      if (start > previousEnd) {
        spans.add(
          TextSpan(
            text: text.substring(previousEnd, start),
          ),
        );
      }

      spans.add(
        TextSpan(
          text: matchedText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              //! Remove @ from the username
              final username = matchedText.substring(1);
              onUsernamePressed(username);
            },
        ),
      );

      previousEnd = end;
    }

    if (previousEnd < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(previousEnd),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(color: textColor),
        children: spans,
      ),
    );
  }
}
