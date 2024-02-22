// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/utils/loader.dart';
import 'package:flutter/material.dart';
import "package:bu_ride/theme/palette.dart";
import 'package:flutter_animate/flutter_animate.dart';

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
        height: height ?? 65.rH(context),
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
                Radius.circular(radius ?? 10),
              ),
            ),
            padding: EdgeInsets.zero,
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: color ?? primaryBlue,
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

//!
class AnimatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? loadingWidth;
  final double? radius;
  final void Function()? onTap;
  final Widget content;
  final Color? color;
  final BoxBorder? border;
  final bool isLoading;
  final Color? loaderColor;
  const AnimatedButton({
    Key? key,
    this.height,
    this.loadingWidth,
    this.width,
    this.radius,
    this.onTap,
    required this.content,
    this.color,
    this.border,
    required this.isLoading,
    this.loaderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
          height: height ?? 65.rH(context),
          width: isLoading
              ? switch (loadingWidth == null) {
                  true => 65.rH(context),
                  false => loadingWidth,
                }
              : switch (width == null) {
                  true => 600.rW(context),
                  false => width,
                },
          decoration: BoxDecoration(
              color: color ?? primaryBase,
              borderRadius: BorderRadius.circular(
                isLoading
                    ? switch (loadingWidth == null) {
                        true => 10,
                        false => loadingWidth!,
                      }
                    : switch (width == null) {
                        true => 20,
                        false => 20,
                      },
              ),
              border: border),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                  width: isLoading
                      ? switch (loadingWidth == null) {
                          true => 65.rW(context),
                          false => loadingWidth,
                        }
                      : switch (width == null) {
                          true => 600.rW(context),
                          false => width,
                        },
                  child: Center(
                      child: isLoading
                          ? Loadinggg(
                              color: loaderColor ?? neutralWhite,
                            ).fadeIn(delay: 800.ms)
                          : content))),
        ),
      ),
    );
  }
}

class AnimatedButton2 extends StatelessWidget {
  final double? height;
  final double? width;
  final double? loadingWidth;
  final double? radius;
  final void Function()? onTap;
  final Widget content;
  final Color? color;
  final BoxBorder? border;
  final bool isLoading;
  final Color? loaderColor;
  const AnimatedButton2({
    Key? key,
    this.height,
    this.loadingWidth,
    this.width,
    this.radius,
    this.onTap,
    required this.content,
    this.color,
    this.border,
    required this.isLoading,
    this.loaderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: IgnorePointer(
          ignoring: true,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            curve: Curves.fastOutSlowIn,
            height: height ?? 65.rH(context),
            width: isLoading
                ? switch (loadingWidth == null) {
                    true => 65.rH(context),
                    false => loadingWidth,
                  }
                : switch (width == null) {
                    true => 600.rW(context),
                    false => width,
                  },
            decoration: BoxDecoration(
                color: color ?? primaryBlue,
                borderRadius: BorderRadius.circular(
                  isLoading
                      ? switch (loadingWidth == null) {
                          true => 10,
                          false => loadingWidth!,
                        }
                      : switch (width == null) {
                          true => 20,
                          false => 20,
                        },
                ),
                border: border),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                    width: isLoading
                        ? switch (loadingWidth == null) {
                            true => 65.rW(context),
                            false => loadingWidth,
                          }
                        : switch (width == null) {
                            true => 600.rW(context),
                            false => width,
                          },
                    child: Center(
                        child: isLoading
                            ? Loadinggg(
                                color: loaderColor ?? neutralWhite,
                              ).fadeIn(delay: 800.ms)
                            : content))),
          ),
        ),
      ),
    );
  }
}
