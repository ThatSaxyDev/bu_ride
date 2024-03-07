import 'package:bu_ride/app/orders/providers/order_providers.dart';
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/models/order_model.dart';
import 'package:bu_ride/models/student_model.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/button.dart';
import 'package:bu_ride/shared/app_widgets/myicon.dart';
import 'package:bu_ride/shared/constants/regex.dart';
import 'package:bu_ride/shared/utils/nav.dart';
import 'package:bu_ride/shared/utils/snack_bar.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class OrderStateNotifier extends Notifier<OrderState> {
  @override
  OrderState build() => const OrderState();

  void startLoading() => state = state.copyWith(isLoading: true);

  void stopLoading() => state = state.copyWith(isLoading: false);

  //! place order
  void placeOrder({
    required String firstName,
    required String lastName,
    required String email,
    required String passengerCount,
    required String pickUpLocation,
    required String destination,
    required DriverModel? driver,
    required DateTime pickupDate,
    required TimeOfDay pickUpTime,
    required BuildContext context,
    required void Function()? onSuccess,
  }) async {
    // Obtain shared preferences.

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
        theMessage: 'Last Name is required',
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

    if (passengerCount.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'Passenger Count is required',
        theType: NotificationType.failure,
      );
      return;
    }

    if (pickUpLocation.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'Pick Up Location is required',
        theType: NotificationType.failure,
      );
      return;
    }
    if (destination.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'Destination is required',
        theType: NotificationType.failure,
      );
      return;
    }
    if (driver == null) {
      showBanner(
        context: context,
        theMessage: 'Please select an available driver',
        theType: NotificationType.failure,
      );
      return;
    }

    String orderId = const Uuid().v1();

    OrderModel order = OrderModel(
      id: orderId,
      firstName: firstName,
      lastName: lastName,
      emailAddress: email,
      pickUpLocation: pickUpLocation,
      destination: destination,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      passengerCount: int.parse(passengerCount),
      driverId: driver.id,
      driverFirstName: driver.firstName,
      driverLastName: driver.lastName,
      pickUpDate: pickupDate,
      pickUpTime: pickUpTime,
      rideStatus: RideStatus.notStarted,
    );

    startLoading();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await ref.read(orderControllerProvider).placeOrder(
          order: order,
          onError: (error) {
            stopLoading();
            showBanner(
              context: context,
              theMessage: error.message,
              theType: NotificationType.failure,
            );
          },
          onSuccess: () async {
            stopLoading();
            onSuccess!();
            prefs.setString('BU_RIDE_FN', firstName);
            prefs.setString('BU_RIDE_LN', lastName);
            prefs.setString('BU_RIDE_EM', email);
            showBanner(
              context: context,
              theMessage: 'You have placed an order',
              theType: NotificationType.success,
            );
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MyIcon(
                      icon: 'booking',
                      height: 150,
                    ),
                    const SizedBox(
                      height: 51,
                    ),
                    "Booking Successful!".txt20(color: primaryBlue),
                  ],
                ),
                content: "".txt14(),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  MaterialButton(
                    child: const Text(""),
                    onPressed: () {
                      // goBack(context);
                    },
                  ),
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: null,
                    child: BButton(
                      height: 35,
                      width: 100,
                      onTap: () {
                        goBack(context);
                      },
                      text: 'Done',
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }

  //! delete order
  void deleteOrder({
    required OrderModel order,
    required BuildContext context,
  }) async {
    startLoading();

    await ref.read(orderControllerProvider).deleteOrder(
          order: order,
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
              theMessage: 'Order deleted',
              theType: NotificationType.success,
            );
          },
        );
  }

  //! edit order status
  void editOrder({
    required OrderModel order,
    required BuildContext context,
  }) async {
    startLoading();

    await ref.read(orderControllerProvider).editOrder(
          order: order,
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
            // showBanner(
            //   context: context,
            //   theMessage: 'Driver details edited',
            //   theType: NotificationType.success,
            // );
          },
        );
  }
}

class OrderState {
  final bool isLoading;

  const OrderState({
    this.isLoading = false,
  });

  OrderState copyWith({
    bool? isLoading,
  }) {
    return OrderState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
