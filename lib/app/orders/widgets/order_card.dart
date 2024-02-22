import 'package:bu_ride/models/order_model.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/custom_flex.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OrderCard extends ConsumerWidget {
  final OrderModel order;
  const OrderCard({
    super.key,
    required this.order,
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
                order.firstName.txt16(
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
                4,
                (index) => CustomizableRow(
                  flexValues: const [1, 8],
                  children: [
                    (switch (index) {
                      0 => 'Full Name:',
                      1 => 'Email Address:',
                      2 => 'Pick-up Location:',
                      _ => 'Destination:',
                    })
                        .txt(
                      size: 15,
                    ),
                    (switch (index) {
                      0 => '${order.firstName} ${order.lastName}',
                      1 => order.emailAddress,
                      2 => order.pickUpLocation,
                      _ => order.destination,
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
