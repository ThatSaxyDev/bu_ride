import 'package:bu_ride/app/auth/providers/auth_providers.dart';
import 'package:bu_ride/models/admin_midel.dart';
import 'package:bu_ride/shared/utils/failure.dart';
import 'package:bu_ride/shared/utils/regex.dart';
import 'package:bu_ride/shared/utils/snack_bar.dart';
import 'package:bu_ride/shared/utils/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }

  //! SIGN UP
  void signUpAdmin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (!AppRegEx.regexEmail.hasMatch(email)) {
      showBanner(
        context: context,
        theMessage: 'Please Enter a valid email address',
        theType: NotificationType.failure,
      );
      return;
    }

    if (password.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'Password is required',
        theType: NotificationType.failure,
      );
      return;
    }

    if (password.length < 8) {
      showBanner(
        context: context,
        theMessage: 'Password is too short',
        theType: NotificationType.failure,
      );
      return;
    }

    startLoading();

    await ref.read(authControllerProvider.notifier).signUpAdmin(
          email: email,
          password: password,
          onError: (error) {
            stopLoading();
            showBanner(
              context: context,
              theMessage: error.message,
              theType: NotificationType.failure,
            );
          },
          onSuccess: () {
            stopLoading();
            showBanner(
              context: context,
              theMessage: 'Sign up successful',
              theType: NotificationType.success,
            );
          },
        );
  }

  //! LOG IN
  Future<void> loginAdmin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'Please input valid details',
        theType: NotificationType.failure,
      );
      return;
    }

    if (!AppRegEx.regexEmail.hasMatch(email)) {
      showBanner(
        context: context,
        theMessage: 'Please Enter a valid email address',
        theType: NotificationType.failure,
      );
      return;
    }

    if (password.isEmpty) {
      showBanner(
        context: context,
        theMessage: 'Password is required',
        theType: NotificationType.failure,
      );
      return;
    }

    if (password.length < 8) {
      showBanner(
        context: context,
        theMessage: 'Password is too short',
        theType: NotificationType.failure,
      );
      return;
    }

    startLoading();

    await ref.read(authControllerProvider.notifier).logInAdmin(
          email: email,
          password: password,
          onError: (error) {
            stopLoading();
            showBanner(
              context: context,
              theMessage: error.message,
              theType: NotificationType.failure,
            );
          },
          onSuccess: () {
            stopLoading();
            showBanner(
              context: context,
              theMessage: 'Log in successful',
              theType: NotificationType.success,
            );
          },
        );
  }

  //! LOG OUT
  void logOut({required BuildContext context}) async {
    startLoading();
    await ref.read(authControllerProvider.notifier).logOut(
      onError: (Failure error) {
        stopLoading();
        showBanner(
          context: context,
          theMessage: error.message,
          theType: NotificationType.failure,
        );
      },
      onSuccess: () {
        stopLoading();
      },
    );
  }

  //! edit Admin
  Future<void> editAdmin({
    required String fullname,
    required String username,
    required String phoneNumber,
    required String bio,
    required BuildContext context,
  }) async {
    startLoading();
    AdminModel admin = ref.read(userDataControllerProvider.notifier).user!;
    await ref.read(authControllerProvider.notifier).editadmin(
          admin: admin.copyWith(
            fullName: fullname,
            userName: username,
            phoneNumber: phoneNumber,
            bio: bio,
          ),
          onError: (Failure error) {
            stopLoading();
            showBanner(
              context: context,
              theMessage: error.message,
              theType: NotificationType.failure,
            );
          },
          onSuccess: () {
            stopLoading();
            showBanner(
              context: context,
              theMessage: 'User details updated',
              theType: NotificationType.success,
            );
            ref.read(authControllerProvider.notifier).getUSer();
          },
        );
  }
}

class AuthState {
  final bool isLoading;

  const AuthState({
    this.isLoading = false,
  });

  AuthState copyWith({
    bool? isLoading,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
