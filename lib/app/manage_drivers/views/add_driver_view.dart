import 'package:bu_ride/app/manage_drivers/providers/manage_drivers_providers.dart';
import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/text_input.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/app_widgets/button.dart';

class AddDriverView extends ConsumerStatefulWidget {
  const AddDriverView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddDriverViewState();
}

class _AddDriverViewState extends ConsumerState<AddDriverView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emaailController = TextEditingController();
  final TextEditingController _vatController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final driversState = ref.watch(manageDriversNotifierProvider);
    final driversStateNotifier =
        ref.read(manageDriversNotifierProvider.notifier);
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
                        'Add Driver'.txt18(fontWeight: FontWeight.w700),
                        // '+ Add Driver'.txt18()
                      ],
                    ),
                    const SizedBox(height: 28),
                    TextInputWidget(
                      inputTitle: 'First Name',
                      hintText: '',
                      controller: _firstNameController,
                    ),
                    36.sbH(context),
                    TextInputWidget(
                      inputTitle: 'Last Name',
                      hintText: '',
                      controller: _lastNameController,
                    ),
                    36.sbH(context),
                    TextInputWidget(
                      inputTitle: 'Email Adress',
                      hintText: '',
                      controller: _emaailController,
                    ),
                    36.sbH(context),
                    TextInputWidget(
                      inputTitle: 'VAT',
                      hintText: '',
                      controller: _vatController,
                    ),
                    36.sbH(context),
                    TextInputWidget(
                      inputTitle: 'Phone Number',
                      hintText: '',
                      controller: _phoneController,
                    ),
                    50.sbH(context),
                    driversState.isLoading
                        ? const CircularProgressIndicator()
                        : BButton(
                            onTap: () {
                              driversStateNotifier.addDriver(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emaailController.text,
                                phone: _phoneController.text,
                                context: context,
                              );
                            },
                            width: double.infinity,
                            text: 'Add',
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
