import 'package:bu_ride/app/auth/notifiers/user_data_controller.dart';
import 'package:bu_ride/app/auth/repositories/auth_repository.dart';
import 'package:bu_ride/shared/services/firebase_storage_service.dart';
import 'package:bu_ride/shared/utils/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final UserDataController _userDataController;
  final StorageRepository _storageRepository;
  AuthController({
    required AuthRepository authRepository,
    required UserDataController userDataController,
    required StorageRepository storageRepository,
  })  : _authRepository = authRepository,
        _userDataController = userDataController,
        _storageRepository = storageRepository,
        super(false);

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  //! SIGN UP
  Future<void> signUpAdmin({
    required String email,
    required String password,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _authRepository.signUpAdmin(
      email: email,
      password: password,
    );

    res.fold(
      (l) => onError!(l),
      (admin) {
        _userDataController.setUserData(currentPayload: admin);
        onSuccess!();
      },
    );
  }

  //! LOG IN
  Future<void> logInAdmin({
    required String email,
    required String password,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _authRepository.logInAdmin(
      email: email,
      password: password,
    );

    res.fold(
      (l) => onError!(l),
      (admin) {
        _userDataController.setUserData(currentPayload: admin);
        onSuccess!();
      },
    );
  }

  //! LOG OUT
  Future<void> logOut({
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _authRepository.logOut();

    res.fold(
      (l) => onError!(l),
      (r) {
        _userDataController.removeUserData();
        onSuccess!();
      },
    );
  }
}
