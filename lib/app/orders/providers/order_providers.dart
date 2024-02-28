import 'package:bu_ride/app/auth/providers/auth_providers.dart';
import 'package:bu_ride/app/orders/notifiers/order_state_notifier.dart';
import 'package:bu_ride/app/orders/repositories/order_repository.dart';
import 'package:bu_ride/shared/providers/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/order_controller.dart';

//! order state notifier provider
final orderRideStateNotifierProvider =
    NotifierProvider<OrderStateNotifier, OrderState>(() {
  return OrderStateNotifier();
});

Provider<OrderRepository> orderRepositoryProvider = Provider((ref) {
  FirebaseFirestore firestore = ref.read(firestoreProvider);
  return OrderRepository(
    firestore: firestore,
  );
});

final orderControllerProvider = Provider<OrderController>((ref) {
  return OrderController(
    orderRepository: ref.watch(orderRepositoryProvider),
    userDataController: ref.watch(userDataControllerProvider.notifier),
  );
});

// final getDriversProviderr = StreamProvider((ref) {
//   final orderController = ref.watch(orderControllerProvider);
//   return orderController.getAllDrivers();
// });

final getOrdersProviderr = StreamProvider((ref) {
  final orderController = ref.watch(orderControllerProvider);
  return orderController.getAllOrders();
});
