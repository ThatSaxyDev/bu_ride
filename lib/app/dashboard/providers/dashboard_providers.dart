import 'package:bu_ride/app/dashboard/notifiers/dashboard_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//! dashboard notifier provider
final dashboardStateNotifierProvider =
    NotifierProvider<DashboardStateNotifier, DashboardState>(() {
  return DashboardStateNotifier();
});
