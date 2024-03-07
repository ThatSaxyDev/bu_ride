import 'package:bu_ride/app/auth/views/admin_login_view.dart';
import 'package:bu_ride/app/dashboard/views/dashboard_view.dart';
import 'package:bu_ride/app/empty_view.dart';
import 'package:bu_ride/app/orders/views/order_ride_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

void nav(String destination, BuildContext context) {
  Routemaster.of(context).push(destination);
}

//! these routes would be desplayed when the user is logged out
final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => MaterialPage(
          child: Consumer(
            builder: (context, ref, child) {
              int page = ref.watch(navnavProvider);
              // NavNav navnav = ref.read(navnavProvider.notifier);
              return page == 0 ? const OrderRideView() : const AdminLoginView();
            },
          ),
        ),
    // AdminLoginView.name: (_) => const MaterialPage(
    //       child: AdminLoginView(),
    //     ),
  },
  onUnknownRoute: (path) => const MaterialPage(
    child: EmptyView(),
  ),
);

//! these routes would be displayed when the user is logged in as an employee
final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: DashboardView(),
        ),
  },
  onUnknownRoute: (path) => const MaterialPage(
    child: EmptyView(),
  ),
);

final navnavProvider = NotifierProvider<NavNav, int>(() {
  return NavNav();
});

class NavNav extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void goToLogin() {
    state = 1;
  }

  void goToOrder() {
    state = 0;
  }
}
