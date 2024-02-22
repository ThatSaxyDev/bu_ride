import 'package:bu_ride/models/admin_midel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDataController extends StateNotifier<AdminModel?> {
  UserDataController({
    required this.userDataNotifierRef,
  }) : super(null);

  Ref userDataNotifierRef;

  Future<bool?> get isAlreadyLoggedIn async => state != null;

  Future<void> setUserData({required AdminModel currentPayload}) async =>
      state = currentPayload;

  Future<void> removeUserData() async => state = null;

  AdminModel? get user => state;
}
