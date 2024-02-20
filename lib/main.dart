import 'package:bu_ride/router.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

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
  Widget build(BuildContext context) => TheResponsiveBuilder(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
            title: 'BU Ride',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                // if (user != null) {
                //   getData(ref, user);
                //   if (userModel != null) {
                //     return loggedInRoute;
                //   }
                // }
                return loggedOutRoute;
              },
            ),
            routeInformationParser: const RoutemasterParser(),
          );
        },
      );
}
