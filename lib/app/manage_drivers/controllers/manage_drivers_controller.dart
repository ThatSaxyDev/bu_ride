import 'package:bu_ride/app/manage_drivers/repositories/manage_drivers_repo.dart';
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/shared/utils/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManageDriversController extends StateNotifier<bool> {
  final ManageDriversRepository _manageDriversRepository;
  final Ref _ref;
  ManageDriversController({
    required ManageDriversRepository manageDriversRepository,
    required Ref ref,
  })  : _manageDriversRepository = manageDriversRepository,
        _ref = ref,
        super(false);

  //! add a driver
  Future<void> addDriver({
    required DriverModel driver,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _manageDriversRepository.addDriver(driver: driver);

    res.fold(
      (l) => onError!(l),
      (r) => onSuccess!(),
    );
  }

  //! edit a driver
  Future<void> editDriver({
    required DriverModel driver,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _manageDriversRepository.editDriver(driver: driver);

    res.fold(
      (l) => onError!(l),
      (r) => onSuccess!(),
    );
  }

  //! delete a driver
  Future<void> deleteDriver({
    required DriverModel driver,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _manageDriversRepository.deleteDriver(driver: driver);

    res.fold(
      (l) => onError!(l),
      (r) => onSuccess!(),
    );
  }

  //! get all drivers F
  Future<List<DriverModel>> getAllDriversF() async =>
      _manageDriversRepository.getAllDriversF();

  Stream<List<DriverModel>> getAllDrivers() =>
      _manageDriversRepository.getAllDrivers();
}
