import 'package:bu_ride/app/auth/providers/auth_providers.dart';
import 'package:bu_ride/app/dashboard/notifiers/dashboard_state_notifier.dart';
import 'package:bu_ride/app/dashboard/providers/dashboard_providers.dart';
import 'package:bu_ride/shared/app_constants.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/shared/app_widgets/app_divider.dart';
import 'package:bu_ride/shared/app_widgets/button.dart';
import 'package:bu_ride/shared/app_widgets/myicon.dart';
import 'package:bu_ride/shared/utils/enums.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SideNav extends ConsumerWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DashboardStateNotifier dashboardStateNotifier =
        ref.read(dashboardStateNotifierProvider.notifier);
    DashboardState dashboardState = ref.watch(dashboardStateNotifierProvider);
    final authState = ref.watch(authStateNotifierProvider);
    final authStateNotifier = ref.read(authStateNotifierProvider.notifier);
    return AnimatedContainer(
      duration: 300.ms,
      height: height(context),
      width: dashboardState.isSideNavExpanded ? 334 : 122,
      color: offWhite,
      child: Stack(
        children: [
          //! stuff
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                43.sbH(context),
                Image.asset(
                  'bu_logo'.png,
                  height: 45.rH(context),
                  width: 46.rW(context),
                ).alignCenter(),
                34.64.sbH(context),
                const AppDivider(),
                34.64.sbH(context),
                Padding(
                  padding: EdgeInsets.only(
                      left: 16.rW(context), right: 32.rW(context)),
                  child: SeparatedColumn(
                    children: List.generate(
                      navItems.length,
                      (index) {
                        NavItem navItem = navItems[index];
                        return dashboardState.isSideNavExpanded
                            ? AnimatedButton2(
                                onTap: () => dashboardStateNotifier
                                    .switchToPageIndex(index),
                                color: index == dashboardState.pageIndex
                                    ? backblue
                                    : offWhite,
                                content: Row(
                                  children: [
                                    20.sbW(context),
                                    MyIcon(
                                      icon: navItem.name,
                                      height: 32.rW(context),
                                      color: index == dashboardState.pageIndex
                                          ? primaryBlue2
                                          : greyy,
                                    ),
                                    12.sbW(context),
                                    navItem.label.txt(
                                      size: 16.rW(context),
                                      fontWeight:
                                          index == dashboardState.pageIndex
                                              ? FontWeight.w700
                                              : FontWeight.w500,
                                      color: index == dashboardState.pageIndex
                                          ? primaryBlue2
                                          : greyy,
                                    ),
                                  ],
                                ),
                                isLoading: false,
                              )
                            : BButton(
                                width: 65.rW(context),
                                onTap: () => dashboardStateNotifier
                                    .switchToPageIndex(index),
                                color: index == dashboardState.pageIndex
                                    ? backblue
                                    : offWhite,
                                isText: false,
                                item: Center(
                                  child: MyIcon(
                                    icon: navItem.name,
                                    height: 32.rW(context),
                                    color: index == dashboardState.pageIndex
                                        ? primaryBlue2
                                        : greyy,
                                  ),
                                ),
                              );
                      },
                    ),
                    separatorBuilder: () => 20.sbH(context),
                  ),
                ),
                const Spacer(),
                const AppDivider(),
                SizedBox(
                  height: 114.rH(context),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 36.rH(context)),
                    child: Center(
                      child: Row(
                        children: [
                          33.sbW(context),
                          authState.isLoading
                              ? const CircularProgressIndicator()
                              : CircleAvatar(
                                  radius: 19.rH(context),
                                ).tap(onTap: () {
                                  authStateNotifier.logOut(context: context);
                                }),
                          10.sbW(context),
                          SizedBox(
                            height: 50.rH(context),
                            child: Column(
                              children: [
                                'ADMIN'.txt(color: primaryBlue),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 2.rW(context),
                                      backgroundColor: primaryBlue2,
                                    ),
                                    5.sbW(context),
                                    'Online'.txt(size: 10, color: primaryBlue),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height(context),
            width: 16,
            color: backblue,
          ).alignCenterRight(),
          Positioned(
            right: 0,
            top: 40,
            child: MyIcon(
              onTap: () => dashboardStateNotifier.toggleSideNav(),
              icon: dashboardState.isSideNavExpanded ? 'closenav' : 'opennav',
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
