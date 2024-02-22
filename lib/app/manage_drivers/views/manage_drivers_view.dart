import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ManageDriversView extends ConsumerWidget {
  const ManageDriversView({super.key});

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
              120.sbH(context),
              Container(
                // height: 110.rH(context),
                width: 986.rW(context),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.rW(context),
                  vertical: 28.rH(context),
                ),
                decoration: BoxDecoration(
                  color: neutralWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Our Drivers'.txt18(fontWeight: FontWeight.w700),
                        '+ Add Driver'.txt18()
                      ],
                    ),
                    const SizedBox(height: 28),
                    SeparatedColumn(
                      separatorBuilder: () => const SizedBox(height: 16),
                      children: List.generate(
                        12,
                        (index) => Container(
                          height: 132,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: backk,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
