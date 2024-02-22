//! the auth repository provider
import 'package:bu_ride/app/auth/controllers/auth_controller.dart';
import 'package:bu_ride/app/auth/notifiers/auth_state_notifier.dart';
import 'package:bu_ride/app/auth/notifiers/user_data_controller.dart';
import 'package:bu_ride/app/auth/repositories/auth_repository.dart';
import 'package:bu_ride/models/admin_midel.dart';
import 'package:bu_ride/shared/providers/firebase_providers.dart';
import 'package:bu_ride/shared/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Provider<AuthRepository> authRepositoryProvider = Provider((ref) {
  FirebaseFirestore firestore = ref.read(firestoreProvider);
  FirebaseAuth auth = ref.read(authProvider);
  return AuthRepository(
    firestore: firestore,
    auth: auth,
  );
});

//! the user data controller provider
StateNotifierProvider<UserDataController, AdminModel?>
    userDataControllerProvider = StateNotifierProvider(
  (ref) => UserDataController(userDataNotifierRef: ref),
);

//! the auth controller provider
StateNotifierProvider<AuthController, bool> authControllerProvider =
    StateNotifierProvider((ref) {
  AuthRepository authRepository = ref.watch(authRepositoryProvider);
  UserDataController userDataController =
      ref.watch(userDataControllerProvider.notifier);
  StorageRepository storageRepository = ref.watch(storageRepositoryProvider);
  return AuthController(
    authRepository: authRepository,
    userDataController: userDataController,
    storageRepository: storageRepository,
  );
});

//! this provider is used to watch whether the user is signed in or signed out
StreamProvider<User?> authStateChangeProvider = StreamProvider((ref) {
  AuthController authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

//! the auth state provider
final authStateNotifierProvider =
    NotifierProvider<AuthStateNotifier, AuthState>(() {
  return AuthStateNotifier();
});
