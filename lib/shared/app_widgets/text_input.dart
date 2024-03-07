// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import "package:bu_ride/theme/palette.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TextInputWidget extends StatelessWidget {
  final double? height;
  final double? fieldHeight;
  final double? width;
  final String hintText;
  final String inputTitle;
  final TextEditingController controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Color? titleColor;
  final Color? borderColor;
  final FontWeight? titleFontWeight;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? iconn;
  final int? maxLength;
  final void Function()? onEditingComplete;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final bool? autofocus;
  final int? maxLines;
  const TextInputWidget({
    Key? key,
    this.height,
    this.fieldHeight,
    this.width,
    required this.hintText,
    required this.inputTitle,
    required this.controller,
    this.obscuretext = false,
    this.validator,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.titleColor,
    this.borderColor,
    this.titleFontWeight,
    this.onTap,
    this.onTapOutside,
    this.iconn,
    this.maxLength,
    this.onEditingComplete,
    this.textCapitalization,
    this.readOnly,
    this.autofocus,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        height: height ??
            getValueForScreenType(context: context, mobile: 70.h, desktop: 75),
        width: width ?? double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              inputTitle,
              style: TextStyle(
                color: titleColor ?? const Color(0xFF6B7280),
                fontSize: getValueForScreenType(
                    context: context, mobile: 16, desktop: 18),
                fontWeight: titleFontWeight,
                height: 1.43,
              ),
            ),
            SizedBox(
              height: fieldHeight ??
                  getValueForScreenType(
                      context: context, mobile: 44.h, desktop: 44),
              child: TextFormField(
                maxLines: maxLines,
                autofocus: autofocus ?? false,
                readOnly: readOnly ?? false,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                onEditingComplete: onEditingComplete,
                maxLength: maxLength,
                onTap: onTap,
                onTapOutside: onTapOutside,
                keyboardType: keyboardType,
                focusNode: focusNode,
                onFieldSubmitted: onFieldSubmitted,
                onChanged: onChanged,
                style: TextStyle(
                  color: const Color(0xFF111827),
                  fontSize: getValueForScreenType(
                      context: context, mobile: 14.sp, desktop: 18),
                  fontWeight: FontWeight.w500,
                  height: 1.43,
                ),
                controller: controller,
                inputFormatters: inputFormatters,
                obscureText: obscuretext,
                obscuringCharacter: '*',
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF2F4F7),
                  filled: true,
                  // isDense: true,
                  suffix: suffix,
                  contentPadding: getValueForScreenType(
                    context: context,
                    mobile: EdgeInsets.symmetric(vertical: 10.h)
                        .copyWith(left: 12.w),
                    desktop: const EdgeInsets.symmetric(vertical: 10)
                        .copyWith(left: 12),
                  ),

                  helperText: " ",
                  helperStyle: const TextStyle(fontSize: 0.0005),
                  errorStyle: const TextStyle(fontSize: 0.0005),
                  suffixIcon: suffixIcon,
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 20, minWidth: 20),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: const Color(0xFF9CA3AF),
                    fontSize: getValueForScreenType(
                        context: context, mobile: 14.sp, desktop: 18),
                    fontWeight: FontWeight.w500,
                    height: 1.43,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor ?? Colors.transparent),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor ?? Colors.transparent),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor ?? Colors.transparent),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor ?? Colors.transparent),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor ?? Colors.transparent),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                validator: validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
