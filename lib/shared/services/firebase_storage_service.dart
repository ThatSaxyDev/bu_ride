import 'dart:io';

import 'package:bu_ride/app/auth/notifiers/user_data_controller.dart';
import 'package:bu_ride/models/admin_midel.dart';
import 'package:bu_ride/shared/utils/failure.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage;
  final UserDataController _userDataController;
  StorageRepository({
    required FirebaseStorage firebaseStorage,
    required UserDataController userDataController,
  })  : _firebaseStorage = firebaseStorage,
        _userDataController = userDataController;

  FutureEither<String> storeFile({
    required File? file,
  }) async {
    try {
      AdminModel userFromState = _userDataController.user!;
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = _firebaseStorage
          .ref()
          .child("images/") //! TODO:
          .child(uniqueFileName);
      UploadTask uploadTask;

      uploadTask = reference.putFile(file!);

      final snapshot = await uploadTask;

      return right(await snapshot.ref.getDownloadURL());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
