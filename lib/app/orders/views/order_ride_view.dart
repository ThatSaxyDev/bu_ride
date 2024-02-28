import 'package:bu_ride/app/auth/views/admin_login_view.dart';
import 'package:bu_ride/app/manage_drivers/providers/manage_drivers_providers.dart';
import 'package:bu_ride/app/orders/providers/order_providers.dart';
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/responsize/screen_type_layout.dart';
import 'package:bu_ride/router.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/button.dart';
import 'package:bu_ride/shared/app_widgets/custom_flex.dart';
import 'package:bu_ride/shared/app_widgets/text_input.dart';
import 'package:bu_ride/shared/utils/dropdown.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRideView extends ConsumerStatefulWidget {
  const OrderRideView({super.key});

  static const String name = '/order-ride';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderRideViewState();
}

class _OrderRideViewState extends ConsumerState<OrderRideView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passengerCountController =
      TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  DriverModel? selectedDriver;

  DateTime pickupDate = DateTime.now();
  TimeOfDay pickUpTime = TimeOfDay.now();

  List<CoolDropdownItem<String>> driverDropdownItems = [];

  final driverDropDownController = DropdownController();

  void read() async {
    await Future.delayed(100.ms);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _firstNameController.text = prefs.getString('BU_RIDE_FN') ?? '';
    _lastNameController.text = prefs.getString('BU_RIDE_LN') ?? '';
    _emailController.text = prefs.getString('BU_RIDE_EM') ?? '';
  }

  @override
  void initState() {
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(orderRideStateNotifierProvider);
    final orderStateNotifier =
        ref.read(orderRideStateNotifierProvider.notifier);
    final driversProvider = ref.watch(getDriversProviderr);
    return Scaffold(
      backgroundColor: neutralWhite,
      body: ScreenTypeLayoutWrapper(
        mobile: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.sH,
                  Image.asset(
                    'bu_logo'.png,
                    height: 50.h,
                    width: 50.w,
                  ),
                  30.sH,
                  'Online Ride Booking'.txt(
                      size: 32,
                      color: primaryBlue,
                      fontWeight: FontWeight.w700),
                  20.sH,
                  'Enter these details'.txt(
                      size: 14, color: grey600, fontWeight: FontWeight.w600),
                  20.sH,
                  //! firstname
                  TextInputWidget(
                    inputTitle: 'FirstName',
                    hintText: '',
                    controller: _firstNameController,
                  ),
                  36.sH,
                  TextInputWidget(
                    inputTitle: 'Last Name',
                    hintText: '',
                    controller: _lastNameController,
                  ),
                  36.sH,
                  TextInputWidget(
                    inputTitle: 'Email',
                    hintText: 'e.g you@example.com',
                    controller: _emailController,
                  ),
                  36.sH,

                  //! passenger
                  TextInputWidget(
                    inputTitle: 'How Many Passengers',
                    hintText: 'e.g 1',
                    controller: _passengerCountController,
                  ),
                  36.sH,

                  //! Pick Up Location
                  TextInputWidget(
                    inputTitle: 'Pick Up Location',
                    hintText: 'e.g SAT Parking Lot',
                    controller: _pickupController,
                  ),
                  36.sH,

                  //! Destination
                  TextInputWidget(
                    inputTitle: 'Destination',
                    hintText: 'e.g Bethel hall',
                    controller: _destinationController,
                  ),
                  36.sH,
                  driversProvider.when(
                    data: (data) {
                      if (data.isEmpty) {
                        return 'No drivers found'.txt();
                      }
                      return Dropdown(
                        title: 'Location',
                        items: data,
                        onChange: (driver) {
                          setState(() {
                            selectedDriver = driver;
                          });
                          driverDropDownController.close();
                        },
                        controller: driverDropDownController,
                      );
                    },
                    error: (e, s) {
                      return 'An error occurred fetching available drivers'
                          .txt();
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  36.sH,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Date',
                        style: TextStyle(
                          color: const Color(0xFF6B7280),
                          fontSize: getValueForScreenType(
                              context: context, mobile: 16, desktop: 18),
                          height: 1.43,
                        ),
                      ),
                      7.sH,
                      Container(
                        height: 44,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFF2F4F7),
                        ),
                        child: formatDateee(pickupDate).txt().alignCenterLeft(),
                      ).tap(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            setState(() {
                              pickupDate = pickedDate;
                            });
                          } else {
                            "Date is not selected".log();
                          }
                        },
                      ),
                    ],
                  ),
                  36.sH,
                  //! time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(
                          color: const Color(0xFF6B7280),
                          fontSize: getValueForScreenType(
                              context: context, mobile: 16, desktop: 18),
                          height: 1.43,
                        ),
                      ),
                      7.sH,
                      Container(
                        height: 44,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFF2F4F7),
                        ),
                        child:
                            formatTimeOfDay(pickUpTime).txt().alignCenterLeft(),
                      ).tap(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: pickUpTime,
                          );

                          if (pickedTime != null) {
                            setState(() {
                              pickUpTime = pickedTime;
                            });
                          } else {
                            "Time is not selected".log();
                          }
                        },
                      ),
                    ],
                  ),
                  36.sH,
                  driversProvider.when(
                    data: (data) {
                      if (data.isEmpty) {
                        return 'No available drivers found'.txt();
                      }
                      return orderState.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : BButton(
                              onTap: () {
                                orderStateNotifier.placeOrder(
                                  firstName: _firstNameController.text.trim(),
                                  lastName: _lastNameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  passengerCount:
                                      _passengerCountController.text.trim(),
                                  pickUpLocation: _pickupController.text.trim(),
                                  destination:
                                      _destinationController.text.trim(),
                                  driver: selectedDriver,
                                  pickupDate: pickupDate,
                                  pickUpTime: pickUpTime,
                                  context: context,
                                  onSuccess: () {
                                    _passengerCountController.clear();
                                    _pickupController.clear();
                                    _destinationController.clear();
                                    setState(() {
                                      selectedDriver = null;
                                    });
                                  },
                                );
                              },
                              width: double.infinity,
                              text: 'Order',
                            ).ignoreTaps(orderState.isLoading);
                    },
                    error: (e, s) {
                      return 'An error occurred fetching available drivers,\nplease try again later'
                          .txt();
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  75.sH,
                ],
              ),
            ),
          ),
        ),

        //! desktop
        desktop: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  image: DecorationImage(
                    image: AssetImage('authBackground'.png),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BButton(
                      onTap: () {
                        nav(AdminLoginView.name, context);
                      },
                      color: neutralWhite,
                      height: 30,
                      width: 100,
                      textColor: primaryBlue,
                      text: 'Admin Login',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120.rW(context)),
                    child: Column(
                      children: [
                        20.hSpace,
                        Image.asset(
                          'bu_logo'.png,
                          height: 50.rH(context),
                          width: 50.rW(context),
                        ),
                        30.hSpace,
                        'Online Ride Booking'.txt(
                            size: 32,
                            color: primaryBlue,
                            fontWeight: FontWeight.w700),
                        20.hSpace,
                        'Enter these details'.txt(
                            size: 14,
                            color: grey600,
                            fontWeight: FontWeight.w600),

                        20.hSpace,
                        //! firstname
                        TextInputWidget(
                          inputTitle: 'FirstName',
                          hintText: '',
                          controller: _firstNameController,
                        ),
                        36.hSpace,

                        //! Pick Up Location
                        TextInputWidget(
                          inputTitle: 'Last Name',
                          hintText: '',
                          controller: _lastNameController,
                        ),
                        36.hSpace,

                        //! Destination
                        TextInputWidget(
                          inputTitle: 'Email',
                          hintText: 'e.g you@example.com',
                          controller: _emailController,
                        ),
                        36.hSpace,

                        //! passenger
                        TextInputWidget(
                          inputTitle: 'How Many Passengers',
                          hintText: 'e.g 1',
                          controller: _passengerCountController,
                        ),
                        36.hSpace,

                        //! Pick Up Location
                        TextInputWidget(
                          inputTitle: 'Pick Up Location',
                          hintText: 'e.g SAT Parking Lot',
                          controller: _pickupController,
                        ),
                        36.hSpace,

                        //! Destination
                        TextInputWidget(
                          inputTitle: 'Destination',
                          hintText: 'e.g Bethel hall',
                          controller: _destinationController,
                        ),
                        36.hSpace,
                        driversProvider.when(
                          data: (data) {
                            if (data.isEmpty) {
                              return 'No drivers found'.txt();
                            }
                            return Dropdown(
                              title: 'Location',
                              items: data,
                              onChange: (driver) {
                                setState(() {
                                  selectedDriver = driver;
                                });
                                driverDropDownController.close();
                              },
                              controller: driverDropDownController,
                            );
                          },
                          error: (e, s) {
                            return 'An error occurred fetching available drivers'
                                .txt();
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        36.hSpace,
                        CustomizableRow(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          flexValues: const [1, 1],
                          children: [
                            //! date
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Select Date',
                                  style: TextStyle(
                                    color: const Color(0xFF6B7280),
                                    fontSize: getValueForScreenType(
                                        context: context,
                                        mobile: 16,
                                        desktop: 18),
                                    height: 1.43,
                                  ),
                                ),
                                7.hSpace,
                                Container(
                                  height: 44,
                                  width: 250,
                                  padding: const EdgeInsets.only(left: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xFFF2F4F7),
                                  ),
                                  child: formatDateee(pickupDate)
                                      .txt()
                                      .alignCenterLeft(),
                                ).tap(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      setState(() {
                                        pickupDate = pickedDate;
                                      });
                                    } else {
                                      "Date is not selected".log();
                                    }
                                  },
                                ),
                              ],
                            ),

                            //! time
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    'Time',
                                    style: TextStyle(
                                      color: const Color(0xFF6B7280),
                                      fontSize: getValueForScreenType(
                                          context: context,
                                          mobile: 16,
                                          desktop: 18),
                                      height: 1.43,
                                    ),
                                  ),
                                ),
                                7.hSpace,
                                Container(
                                  height: 44,
                                  width: 250,
                                  padding: const EdgeInsets.only(left: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xFFF2F4F7),
                                  ),
                                  child: formatTimeOfDay(pickUpTime)
                                      .txt()
                                      .alignCenterLeft(),
                                ).tap(
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: pickUpTime,
                                    );

                                    if (pickedTime != null) {
                                      setState(() {
                                        pickUpTime = pickedTime;
                                      });
                                    } else {
                                      "Time is not selected".log();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),

                        72.hSpace,
                        driversProvider.when(
                          data: (data) {
                            if (data.isEmpty) {
                              return 'No available drivers found'.txt();
                            }
                            return orderState.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : BButton(
                                    onTap: () {
                                      orderStateNotifier.placeOrder(
                                        firstName:
                                            _firstNameController.text.trim(),
                                        lastName:
                                            _lastNameController.text.trim(),
                                        email: _emailController.text.trim(),
                                        passengerCount:
                                            _passengerCountController.text
                                                .trim(),
                                        pickUpLocation:
                                            _pickupController.text.trim(),
                                        destination:
                                            _destinationController.text.trim(),
                                        driver: selectedDriver,
                                        pickupDate: pickupDate,
                                        pickUpTime: pickUpTime,
                                        context: context,
                                        onSuccess: () {
                                          _passengerCountController.clear();
                                          _pickupController.clear();
                                          _destinationController.clear();
                                          setState(() {
                                            selectedDriver = null;
                                          });
                                        },
                                      );
                                    },
                                    width: double.infinity,
                                    text: 'Order',
                                  ).ignoreTaps(orderState.isLoading);
                          },
                          error: (e, s) {
                            return 'An error occurred fetching available drivers,\nplease try again later'
                                .txt();
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        75.hSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatDateee(DateTime dateTime) {
  return DateFormat('MMM dd, yyyy').format(dateTime);
}

String formatDaty(DateTime dateTime) {
  return DateFormat('MMMM dd, yyyy HH:mm').format(dateTime);
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final now = DateTime.now();
  final DateTime dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  final DateFormat formatter = DateFormat('hh:mm a');
  return formatter.format(dateTime);
}
