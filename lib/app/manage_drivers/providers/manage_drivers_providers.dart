import 'package:bu_ride/app/manage_drivers/controllers/manage_drivers_controller.dart';
import 'package:bu_ride/app/manage_drivers/notifiers/manage_drivers_state_notifier.dart';
import 'package:bu_ride/app/manage_drivers/repositories/manage_drivers_repo.dart';
import 'package:bu_ride/shared/providers/firebase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//! the manage drivers repository provider
final manageDriversRepositoryProvider = Provider((ref) {
  return ManageDriversRepository(firestore: ref.watch(firestoreProvider));
});

//! the manage Drivers controller provider
final manageDriversControllerProvider =
    StateNotifierProvider<ManageDriversController, bool>((ref) {
  final manageDriversRepository = ref.watch(manageDriversRepositoryProvider);
  return ManageDriversController(
    manageDriversRepository: manageDriversRepository,
    ref: ref,
  );
});

//! manage drivers notifier provider
final manageDriversNotifierProvider =
    NotifierProvider<ManageDriversStateNotifier, ManageDriversState>(() {
  return ManageDriversStateNotifier();
});

//! gwt drivers future provider
final getDriversProvider = FutureProvider((ref) async {
  final manageDriversController =
      ref.watch(manageDriversControllerProvider.notifier);
  return manageDriversController.getAllDriversF();
});

final getDriversProviderr = StreamProvider((ref) {
  final manageDriversController =
      ref.watch(manageDriversControllerProvider.notifier);
  return manageDriversController.getAllDrivers();
});
