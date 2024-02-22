import 'package:bu_ride/app/auth/views/admin_login_view.dart';
import 'package:bu_ride/app/dashboard/views/dashboard_view.dart';
import 'package:bu_ride/routes.dart';
import 'package:bu_ride/shared/utils/conditional_route_widget.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      title: 'BU Ride',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        // A custom `fadeThrough` route transition animation.
        return Routes.fadeThrough(settings, (context) {
          // Wrap widgets with another widget based on the route.
          // Wrap the page with the ResponsiveScaledBox for desired pages.
          return ConditionalRouteWidget(
              routesExcluded: const [], // Excluding a page from AutoScale.
              builder: (context, child) => ResponsiveScaledBox(
                  // ResponsiveScaledBox renders its child with a FittedBox set to the `width` value.
                  // Set the fixed width value based on the active breakpoint.
                  width: ResponsiveValue<double>(context, conditionalValues: [
                    Condition.equals(name: MOBILE, value: 450),
                    Condition.between(start: 800, end: 1100, value: 800),
                    Condition.between(start: 1000, end: 1440, value: 1000),
                    // There are no conditions for width over 1200
                    // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                  ]).value,
                  child: child!),
              child: BouncingScrollWrapper.builder(
                  context, buildPage(settings.name ?? ''),
                  dragWithMouse: true));
        });
      },
    );
  }

  // onGenerateRoute route switcher.
  // Navigate using the page name, `Navigator.pushNamed(context, ListPage.name)`.
  Widget buildPage(String name) {
    switch (name) {
      case '/':
      case AdminLoginView.name:
        return const AdminLoginView();
      case DashboardView.name:
        return const DashboardView();

      default:
        return const SizedBox.shrink();
    }
  }
}
