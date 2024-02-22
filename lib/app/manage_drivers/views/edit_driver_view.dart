import 'package:bu_ride/app/manage_drivers/providers/manage_drivers_providers.dart';
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/text_input.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/app_widgets/button.dart';

class EditDriverView extends ConsumerStatefulWidget {
  const EditDriverView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditDriverViewState();
}

class _EditDriverViewState extends ConsumerState<EditDriverView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emaailController = TextEditingController();
  final TextEditingController _vatController = TextEditingController();

  DriverModel? driver;

  void getDriverToEdit() async {
    await Future.delayed(100.ms).then((value) {
      driver = ref.read(manageDriversNotifierProvider).driverToEdit;
      if (driver != null) {
        _firstNameController.text = driver!.firstName;
        _lastNameController.text = driver!.lastName;
        _emaailController.text = driver!.emailAddress;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDriverToEdit();
  }

  @override
  Widget build(BuildContext context) {
    final driversState = ref.watch(manageDriversNotifierProvider);
    final driversStateNotifier =
        ref.read(manageDriversNotifierProvider.notifier);

    if (driver == null) {
      return const SizedBox.shrink();
    }
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
                        'Edit Driver'.txt18(fontWeight: FontWeight.w700),
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
                    50.sbH(context),
                    driversState.isLoading
                        ? const CircularProgressIndicator()
                        : BButton(
                            onTap: () {
                              driversStateNotifier.editDriver(
                                driver: driver!.copyWith(
                                  emailAddress: _emaailController.text,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  dateJUpdated: DateTime.now(),
                                ),
                                context: context,
                              );
                            },
                            width: double.infinity,
                            text: 'Edit',
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
