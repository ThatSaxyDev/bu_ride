import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/custom_flex.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DriverCard extends ConsumerWidget {
  final DriverModel driver;
  const DriverCard({
    super.key,
    required this.driver,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 175.rH(context),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 26.rH(context),
        horizontal: 26.rW(context),
      ),
      decoration: BoxDecoration(
        color: backk,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                driver.firstName.txt16(
                  fontWeight: FontWeight.w700,
                  color: greyy,
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: redColor,
                    ),
                    5.sbW(context),
                    'DELETE'.txt14(
                      color: redColor,
                    ),
                  ],
                ),
                30.sbW(context),
                Row(
                  children: [
                    const Icon(Icons.edit),
                    5.sbW(context),
                    'EDIT'.txt14(),
                  ],
                ),
              ],
            ),
            7.5.sbH(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => CustomizableRow(
                  flexValues: const [1, 8],
                  children: [
                    (switch (index) {
                      0 => 'Full Name:',
                      1 => 'Email Address:',
                      _ => 'VAT Number:',
                    })
                        .txt(
                      size: 15,
                    ),
                    (switch (index) {
                      0 => '${driver.firstName} ${driver.lastName}',
                      1 => driver.emailAddress,
                      _ => driver.vatNumber,
                    })
                        .txt(size: 15, fontWeight: FontWeight.w700),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! skel
class CardSkel extends StatelessWidget {
  const CardSkel({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      ignoreContainers: false,
      child: Container(
        height: 175.rH(context),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 26.rH(context),
          horizontal: 26.rW(context),
        ),
        decoration: BoxDecoration(
          color: backk,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  'Dedeke David'.txt16(
                    fontWeight: FontWeight.w700,
                    color: greyy,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        color: redColor,
                      ),
                      5.sbW(context),
                      'DELETE'.txt14(
                        color: redColor,
                      ),
                    ],
                  ),
                  30.sbW(context),
                  Row(
                    children: [
                      const Icon(Icons.edit),
                      5.sbW(context),
                      'EDIT'.txt14(),
                    ],
                  ),
                ],
              ),
              7.5.sbH(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => CustomizableRow(
                    flexValues: const [1, 8],
                    children: [
                      (switch (index) {
                        0 => 'Full Name:',
                        1 => 'Email Address:',
                        _ => 'VAT Number:',
                      })
                          .txt(
                        size: 15,
                      ),
                      (switch (index) {
                        0 => 'Dedeke David',
                        1 => 'abcde@mail.com',
                        _ => 'dscsvsw232',
                      })
                          .txt(size: 15, fontWeight: FontWeight.w700),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
