// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:bu_ride/app/dashboard/providers/dashboard_providers.dart';
import 'package:bu_ride/app/manage_drivers/providers/manage_drivers_providers.dart';
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/shared/constants/regex.dart';
import 'package:bu_ride/shared/utils/snack_bar.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';

class ManageDriversStateNotifier extends Notifier<ManageDriversState> {
  @override
  ManageDriversState build() => const ManageDriversState();

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }

  void setDriverToEditAndMoveToEdit({required DriverModel driver}) {
    state = state.copyWith(driverToEdit: driver);
    ref.read(dashboardStateNotifierProvider.notifier).switchToEditDriver();
  }

  //! add a driver
  void addDriver({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required BuildContext context,
  }) async {
    if (firstName.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'First Name is required',
        theType: NotificationType.failure,
      );
      return;
    }

    if (lastName.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'First Name is required',
        theType: NotificationType.failure,
      );
      return;
    }

    if (!AppRegEx.regexEmail.hasMatch(email)) {
      showBanner(
        context: context,
        theMessage: 'Please Enter a valid email address',
        theType: NotificationType.failure,
      );
      return;
    }

    if (phone.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'Phone number is required',
        theType: NotificationType.failure,
      );
      return;
    }
    String vatNumber = const Uuid().v1();

    DriverModel driver = DriverModel(
      id: vatNumber,
      firstName: firstName,
      lastName: lastName,
      emailAddress: email,
      vatNumber: vatNumber,
      phoneNumber: phone,
      dateJoined: DateTime.now(),
      dateJUpdated: DateTime.now(),
      isAvailable: false,
    );

    startLoading();

    await ref.read(manageDriversControllerProvider.notifier).addDriver(
          driver: driver,
          onError: (error) {
            stopLoading();
            showBanner(
              context: context,
              theMessage: error.message,
              theType: NotificationType.failure,
            );
          },
          onSuccess: () {
            stopLoading();
            showBanner(
              context: context,
              theMessage: 'Driver added successful',
              theType: NotificationType.success,
            );
            // ref.invalidate(getDriversProvider);
            ref
                .read(dashboardStateNotifierProvider.notifier)
                .switchToPageIndex(2);
          },
        );
  }

  //! delete driver
  void deleteDriver({
    required DriverModel driver,
    required BuildContext context,
  }) async {
    startLoading();

    ref.read(manageDriversControllerProvider.notifier).deleteDriver(
          driver: driver,
          onError: (error) {
            stopLoading();
            showBanner(
              context: context,
              theMessage: error.message,
              theType: NotificationType.failure,
            );
          },
          onSuccess: () {
            stopLoading();
            showBanner(
              context: context,
              theMessage: 'Driver deleted',
              theType: NotificationType.success,
            );
          },
        );
  }

  //! edit driver
  void editDriver({
    required DriverModel driver,
    required BuildContext context,
  }) async {
    startLoading();

    ref.read(manageDriversControllerProvider.notifier).editDriver(
          driver: driver,
          onError: (error) {
            stopLoading();
            showBanner(
              context: context,
              theMessage: error.message,
              theType: NotificationType.failure,
            );
          },
          onSuccess: () {
            stopLoading();
            showBanner(
              context: context,
              theMessage: 'Driver details edited',
              theType: NotificationType.success,
            );
            ref
                .read(dashboardStateNotifierProvider.notifier)
                .switchToPageIndex(2);
          },
        );
  }
}

class ManageDriversState {
  final bool isLoading;
  final DriverModel? driverToEdit;

  const ManageDriversState({
    this.isLoading = false,
    this.driverToEdit,
  });

  ManageDriversState copyWith({
    bool? isLoading,
    DriverModel? driverToEdit,
  }) {
    return ManageDriversState(
      isLoading: isLoading ?? this.isLoading,
      driverToEdit: driverToEdit ?? this.driverToEdit,
    );
  }
}
