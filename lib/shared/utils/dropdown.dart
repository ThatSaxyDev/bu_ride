// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Dropdown extends StatefulWidget {
  final String title;
  final List<DriverModel> items;

  final dynamic Function(DriverModel) onChange;
  final double? width;
  final DropdownController controller;
  const Dropdown({
    Key? key,
    required this.title,
    required this.items,
    required this.onChange,
    this.width,
    required this.controller,
  }) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<CoolDropdownItem<DriverModel>> dropdownItems = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.items.length; i++) {
      dropdownItems.add(
        CoolDropdownItem<DriverModel>(
          label: '${widget.items[i].firstName} ${widget.items[i].lastName}',
          value: widget.items[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Driver',
          style: TextStyle(
            color: const Color(0xFF6B7280),
            fontSize: getValueForScreenType(
                context: context, mobile: 16, desktop: 18),
            height: 1.43,
          ),
        ),
        7.hSpace,
        CoolDropdown<DriverModel>(
          controller: widget.controller,
          dropdownList: dropdownItems,
          defaultItem: null,
          onChange: widget.onChange,
          resultOptions: ResultOptions(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: grey500,
            ),
            openBoxDecoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: grey200,
                )),
            boxDecoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: grey200,
                )),
            render: ResultRender.all,
            icon: const SizedBox(
              width: 15,
              height: 15,
              child: CustomPaint(
                painter: DropdownArrowPainter(color: grey400),
              ),
            ),
          ),
          dropdownOptions: DropdownOptions(
            width: widget.width ?? 327,
          ),
          dropdownItemOptions: const DropdownItemOptions(
            alignment: Alignment.center,
            render: DropdownItemRender.label,
            padding: EdgeInsets.all(10),
            selectedPadding: EdgeInsets.all(10),
            textStyle: TextStyle(
              color: primaryBlue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            selectedTextStyle: TextStyle(
              color: neutralWhite,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            selectedBoxDecoration: BoxDecoration(
              color: primaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}
