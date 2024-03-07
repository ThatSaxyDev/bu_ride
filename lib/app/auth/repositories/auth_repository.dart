import 'package:bu_ride/models/admin_midel.dart';
import 'package:bu_ride/shared/constants/constants.dart';
import 'package:bu_ride/shared/constants/firebase_constants.dart';
import 'package:bu_ride/shared/utils/failure.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore;

  CollectionReference get _admins =>
      _firestore.collection(FirebaseConstants.adminsCollection);

  //! GET AUTH STATE CHANGES
  Stream<User?> get authStateChange => _auth.authStateChanges();

  //! SIGN UP
  FutureEither<AdminModel> signUpAdmin({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AdminModel admin;

      if (userCredential.additionalUserInfo!.isNewUser) {
        admin = AdminModel(
          id: userCredential.user!.uid,
          fullName: '',
          userName: '',
          emailAddress: userCredential.user!.email ?? '',
          phoneNumber: '',
          bio: '',
          profilePhoto: Constants.avatarDefault,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await _admins.doc(userCredential.user!.uid).set(admin.toMap());
      } else {
        admin = await getUserData(userCredential.user!.uid).first;
      }

      return right(admin);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! LOG IN
  FutureEither<AdminModel> logInAdmin({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AdminModel admin = await getUserData(userCredential.user!.uid).first;

      return right(admin);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! GET USER DATA
  Stream<AdminModel> getUserData(String uid) {
    return _admins.doc(uid).snapshots().map(
        (event) => AdminModel.fromMap(event.data() as Map<String, dynamic>));
  }

  //! edit admin
  FutureVoid editAdmin({required AdminModel admin}) async {
    try {
      return right(_admins.doc(admin.id).update(admin.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //! LOG OUT
  FutureVoid logOut() async {
    try {
      await _auth.signOut();

      return right(null);
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
