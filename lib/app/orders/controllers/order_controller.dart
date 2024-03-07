import 'package:bu_ride/app/auth/notifiers/user_data_controller.dart';
import 'package:bu_ride/app/orders/repositories/order_repository.dart';
import 'package:bu_ride/models/driver_model.dart';
import 'package:bu_ride/models/order_model.dart';
import 'package:bu_ride/models/student_model.dart';
import 'package:bu_ride/shared/utils/failure.dart';

class OrderController {
  final OrderRepository _orderRepository;
  final UserDataController _userDataController;
  OrderController({
    required OrderRepository orderRepository,
    required UserDataController userDataController,
  })  : _orderRepository = orderRepository,
        _userDataController = userDataController;

  //! //! get all drivers
  Stream<List<DriverModel>> getAllDrivers() => _orderRepository.getAllDrivers();

  //! place order
  Future<void> placeOrder({
    required OrderModel order,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _orderRepository.placeOrder(order: order);

    res.fold(
      (l) => onError!(l),
      (r) => onSuccess!(),
    );
  }

  //! //! get all orders
  Stream<List<OrderModel>> getAllOrders() => _orderRepository.getAllOrders();

  Stream<List<StudentModel>> getAllStudents() =>
      _orderRepository.getAllStudents();

  Stream<List<StudentModel>> getStudentsWithDateJoined(
          {required DateTime dateJoined}) =>
      _orderRepository.getStudentsWithDateJoined(dateJoined: dateJoined);

  //! edit an order
  Future<void> editOrder({
    required OrderModel order,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _orderRepository.editOrder(order: order);

    res.fold(
      (l) => onError!(l),
      (r) => onSuccess!(),
    );
  }

  //! delete an order
  Future<void> deleteOrder({
    required OrderModel order,
    required void Function(Failure)? onError,
    required void Function()? onSuccess,
  }) async {
    final res = await _orderRepository.deleteOrder(order: order);

    res.fold(
      (l) => onError!(l),
      (r) => onSuccess!(),
    );
  }
}
