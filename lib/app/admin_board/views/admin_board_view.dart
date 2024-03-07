import 'package:bu_ride/app/admin_board/widgets/calendar/date_picker_config.dart';
import 'package:bu_ride/app/admin_board/widgets/calendar/flutter_neat_and_clean_calendar.dart';
import 'package:bu_ride/app/manage_drivers/providers/manage_drivers_providers.dart';
import 'package:bu_ride/app/orders/providers/order_providers.dart';
import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/custom_flex.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdminBoardView extends ConsumerWidget {
  const AdminBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height(context),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 36),
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
                    height: 110,
                    width: 473,
                    padding: const EdgeInsets.symmetric(horizontal: 21),
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
                              'Total users'.txt(
                                size: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              10.sbH(context),
                              ref.watch(getStudentsProviderr).when(
                                    data: (data) => data.length.toString().txt(
                                          size: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                    error: (e, s) {
                                      e.log();
                                      return '--'.txt(
                                        size: 16,
                                        fontWeight: FontWeight.w700,
                                      );
                                    },
                                    loading: () {
                                      'dre v'.log();
                                      return '--'.txt(
                                        size: 16,
                                        fontWeight: FontWeight.w700,
                                      );
                                    },
                                  ),
                            ],
                          ),
                          Image.asset(
                            'today'.png,
                            height: 58,
                            width: 55,
                          ),
                        ],
                      ),
                    ),
                  ),
                  24.sbW(context),
                  Container(
                    height: 110,
                    width: 473,
                    padding: const EdgeInsets.symmetric(horizontal: 21),
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
                              ref.watch(getOrdersProviderr).when(
                                    data: (data) => data.length.toString().txt(
                                          size: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                    error: (e, s) => '--'.txt(
                                      size: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    loading: () => '--'.txt(
                                      size: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                            ],
                          ),
                          Image.asset(
                            'totalrides'.png,
                            height: 58,
                            width: 55,
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
                    height: 441,
                    width: 629,
                    margin: const EdgeInsets.only(right: 24),
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      right: 16,
                      left: 16,
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
                            height: 222,
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 24),
                            padding: const EdgeInsets.all(16).copyWith(right: 32),
                            decoration: ShapeDecoration(
                              color: primaryBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  8,
                                  (index) => switch (index) {
                                        0 => Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                6,
                                                (index) => (500 - index * 100)
                                                    .toString()
                                                    .txt(color: neutralWhite)),
                                          ),
                                        _ => Container(
                                            height: index.toDouble() * 20,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: neutralWhite,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                          ).alignBottomCenter()
                                      }),
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
                          const SizedBox(height: 40),
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
                                  (switch (index) {
                                    0 => '1000',
                                    1 => '2000',
                                    _ => ref.watch(getDriversProviderr).when(
                                          data: (data) =>
                                              data.length.toString(),
                                          error: (e, s) => '----',
                                          loading: () => '----',
                                        ),
                                  })
                                      .txt(
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
