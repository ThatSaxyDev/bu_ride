import 'package:bu_ride/app/admin_board/widgets/calendar/date_picker_config.dart';
import 'package:bu_ride/app/admin_board/widgets/calendar/flutter_neat_and_clean_calendar.dart';
import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/custom_flex.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class AdminBoardView extends ConsumerWidget {
  const AdminBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height(context),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 36.rW(context)),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              50.sbH(context),
              'Admin Dashboard'.txt(
                size: 32,
                fontWeight: FontWeight.w600,
                color: neutralBlack,
              ),
              44.sbH(context),
              Row(
                children: [
                  Container(
                    height: 110.rH(context),
                    width: 473.rW(context),
                    padding: EdgeInsets.symmetric(horizontal: 21.rW(context)),
                    decoration: BoxDecoration(
                      color: neutralWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              'Today\'s users'.txt(
                                size: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              10.sbH(context),
                              RichText(
                                text: const TextSpan(
                                  text: '2500',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' +5%',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: greenColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'today'.png,
                            height: 58.rH(context),
                            width: 55.rW(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.sbW(context),
                  Container(
                    height: 110.rH(context),
                    width: 473.rW(context),
                    padding: EdgeInsets.symmetric(horizontal: 21.rW(context)),
                    decoration: BoxDecoration(
                      color: neutralWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Total Ride Order'.txt(
                                size: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              10.sbH(context),
                              RichText(
                                text: const TextSpan(
                                  text: '10',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'totalrides'.png,
                            height: 58.rH(context),
                            width: 55.rW(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              44.sbH(context),
              Row(
                children: [
                  //! graph
                  Container(
                    height: 441.rH(context),
                    width: 629.rW(context),
                    margin: EdgeInsets.only(right: 24.rW(context)),
                    padding: EdgeInsets.only(
                      top: 16.rH(context),
                      bottom: 16.rH(context),
                      right: 16.rW(context),
                      left: 16.rW(context),
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 222.rH(context),
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: ShapeDecoration(
                              color: primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          'Active Users'
                              .txt(
                                size: 18,
                                fontWeight: FontWeight.w700,
                              )
                              .alignCenterLeft(),
                          const SizedBox(
                            height: 6,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text: '(+23%)',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: greenColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' than last week',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: grey500,
                                  ),
                                ),
                              ],
                            ),
                          ).alignCenterLeft(),
                          // const Spacer(),
                          SizedBox(height: 40.rH(context)),
                          CustomizableRow(
                            flexValues: const [1, 1, 1],
                            children: List.generate(
                              DashboardStuff.values.length,
                              (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        DashboardStuff.values[index].name.png,
                                        height: 25,
                                        width: 30,
                                      ),
                                      const SizedBox(width: 12),
                                      DashboardStuff.values[index].name
                                          .toCapitalized()
                                          .txt12(
                                            fontWeight: FontWeight.w700,
                                            color: greyy,
                                          ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.5),
                                  '2000'.txt(
                                    size: 18,
                                    fontWeight: FontWeight.w700,
                                    color: greyy,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! calendar
                  Calendar(
                    startOnMonday: false,
                    isExpandable: true,
                    eventDoneColor: Colors.green,
                    isExpanded: true,
                    selectedColor: primaryBlue,
                    selectedTodayColor: primaryBlue,
                    datePickerConfig: DatePickerConfig(
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now(),
                    ),
                    onDateSelected: (value) {
                      value.log();
                      // setState(() {
                      //   targetDate =
                      //       DateTime(value.year, value.month, value.day);
                      // });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DashboardStuff {
  users,
  orders,
  drivers,
}
