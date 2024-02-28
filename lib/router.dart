import 'package:bu_ride/app/auth/views/admin_login_view.dart';
import 'package:bu_ride/app/dashboard/views/dashboard_view.dart';
import 'package:bu_ride/app/orders/views/order_ride_view.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

void nav(String destination, BuildContext context) {
  Routemaster.of(context).push(destination);
}

//! these routes would be desplayed when the user is logged out
final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: OrderRideView(),
        ),
    AdminLoginView.name: (_) => const MaterialPage(
          child: AdminLoginView(),
        ),
  },
  onUnknownRoute: (path) => const MaterialPage(
    child: Scaffold(),
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
    child: Scaffold(),
  ),
);
