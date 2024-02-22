import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/constants/firebase_constants.dart';
import 'package:bu_ride/shared/utils/failure.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

class ManageDriversRepository {
  final FirebaseFirestore _firestore;
  ManageDriversRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _drivers =>
      _firestore.collection(FirebaseConstants.driversCollection);

  //! add a driver
  FutureVoid addDriver({required DriverModel driver}) async {
    try {
      await _drivers.doc(driver.id).set(driver.toMap());
      return right(null);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! edit a question
  FutureVoid editDriver({required DriverModel driver}) async {
    try {
      return right(_drivers.doc(driver.id).update(driver.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! delete a driver
  FutureVoid deleteDriver({required DriverModel driver}) async {
    try {
      await _drivers.doc(driver.id).delete();
      return right(null);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! get all drivers
  Stream<List<DriverModel>> getAllDrivers() {
    return _drivers.snapshots().map((event) => event.docs
        .map(
          (e) => DriverModel.fromMap(e.data() as Map<String, dynamic>),
        )
        .toList());
  }

  //! get
  Future<List<DriverModel>> getAllDriversF() async {
    try {
      List<DriverModel> drivers = [];

      await for (QuerySnapshot snapshot in _drivers.snapshots()) {
        drivers.addAll(snapshot.docs.map(
            (doc) => DriverModel.fromMap(doc.data() as Map<String, dynamic>)));
      }

      return drivers;
    } on FirebaseException catch (e) {
      e.message!.log();
      throw e.message!;
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
