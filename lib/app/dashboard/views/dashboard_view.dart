import 'package:bu_ride/app/admin_board/views/admin_board_view.dart';
import 'package:bu_ride/app/dashboard/notifiers/dashboard_state_notifier.dart';
import 'package:bu_ride/app/dashboard/providers/dashboard_providers.dart';
import 'package:bu_ride/app/dashboard/widgets/side_nav.dart';
import 'package:bu_ride/app/manage_drivers/views/manage_drivers_view.dart';
import 'package:bu_ride/app/orders/views/orders_view.dart';
import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/myicon.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  static const String name = 'dashboard';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    DashboardState dashboardState = ref.watch(dashboardStateNotifierProvider);
    return Scaffold(
      backgroundColor: backblue,
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Row(
          children: [
            const SideNav(),
            Expanded(child: pages[dashboardState.pageIndex])
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const AdminBoardView(),
  const OrdersView(),
  const ManageDriversView(),
  Center(
    child: 'settings'.txt(),
  ),
];
