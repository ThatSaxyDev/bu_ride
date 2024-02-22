import 'package:bu_ride/app/auth/notifiers/user_data_controller.dart';
import 'package:bu_ride/app/auth/providers/auth_providers.dart';
import 'package:bu_ride/shared/services/firebase_storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//! firestore provider
Provider<FirebaseFirestore> firestoreProvider = Provider(
  (ref) => FirebaseFirestore.instance,
);

//! auth provider
Provider<FirebaseAuth> authProvider = Provider(
  (ref) => FirebaseAuth.instance,
);

//! storage provider
Provider<FirebaseStorage> storageProvider = Provider(
  (ref) => FirebaseStorage.instance,
);

//! storage repo provider
Provider<StorageRepository> storageRepositoryProvider = Provider((ref) {
  FirebaseStorage firebaseStorage = ref.watch(storageProvider);
  UserDataController userDataController =
      ref.watch(userDataControllerProvider.notifier);
  return StorageRepository(
    firebaseStorage: firebaseStorage,
    userDataController: userDataController,
  );
});
