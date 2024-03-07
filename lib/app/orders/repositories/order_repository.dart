import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/models/order_model.dart';
import 'package:bu_ride/models/student_model.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/constants/firebase_constants.dart';
import 'package:bu_ride/shared/utils/failure.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class OrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _drivers =>
      _firestore.collection(FirebaseConstants.driversCollection);

  CollectionReference get _orders =>
      _firestore.collection(FirebaseConstants.ordersCollection);

  CollectionReference get _students =>
      _firestore.collection(FirebaseConstants.studentsCollection);

  //! get all available drivers
  Stream<List<DriverModel>> getAllDrivers() {
    return _drivers.snapshots().map((event) => event.docs
        .map(
          (e) => DriverModel.fromMap(e.data() as Map<String, dynamic>),
        )
        .toList());
  }

  //! place order
  FutureVoid placeOrder({required OrderModel order}) async {
    try {
      bool studentExists = await checkIfStudentExists(order.emailAddress);

      String studentId = const Uuid().v1();

      StudentModel student = StudentModel(
        id: studentId,
        firstName: order.firstName,
        lastName: order.lastName,
        emailAddress: order.emailAddress,
        phoneNumber: '',
        dateJoined: DateTime.now(),
        dateJUpdated: DateTime.now(),
        inARide: false,
      );

      if (!studentExists) {
        _students.doc(studentId).set(student.toMap());
      }
      await _orders.doc(order.id).set(order.toMap());
      return right(null);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! get user data from firebase
  Stream<StudentModel> getStudentData(String uid) {
    return _students.doc(uid).snapshots().map(
        (event) => StudentModel.fromMap(event.data() as Map<String, dynamic>));
  }

  //! check if email exists as a student
  Future<bool> checkIfStudentExists(String email) async {
    try {
      QuerySnapshot<Object?> snapshot =
          await _students.where('emailAddress', isEqualTo: email).get();

      return snapshot.docs.isNotEmpty;
    } catch (e) {
      'Error: $e'.log();
      return false;
    }
  }

  //! get all orders
  Stream<List<OrderModel>> getAllOrders() {
    return _orders.snapshots().map((event) => event.docs
        .map(
          (e) => OrderModel.fromMap(e.data() as Map<String, dynamic>),
        )
        .toList());
  }

  Stream<List<OrderModel>> getAllOrdersDatePlaced() {
    return _orders.snapshots().map((event) => event.docs
        .map(
          (e) => OrderModel.fromMap(e.data() as Map<String, dynamic>),
        )
        .toList());
  }

  //! get all students
  Stream<List<StudentModel>> getAllStudents() {
    return _students.snapshots().map((event) => event.docs
        .map(
          (e) => StudentModel.fromMap(e.data() as Map<String, dynamic>),
        )
        .toList());
  }

  Stream<List<StudentModel>> getStudentsWithDateJoined(
      {required DateTime dateJoined}) {
    return _students.where('dateJoined', isEqualTo: dateJoined).snapshots().map(
        (querySnapshot) => querySnapshot.docs
            .map((doc) =>
                StudentModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList());
  }

  //! edit an order
  FutureVoid editOrder({required OrderModel order}) async {
    try {
      return right(_orders.doc(order.id).update(order.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! delete an order
  FutureVoid deleteOrder({required OrderModel order}) async {
    try {
      await _orders.doc(order.id).delete();
      return right(null);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
