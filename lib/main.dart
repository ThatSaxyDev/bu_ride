import 'package:bu_ride/app/auth/providers/auth_providers.dart';
import 'package:bu_ride/firebase_options.dart';
import 'package:bu_ride/models/admin_midel.dart';
import 'package:bu_ride/router.dart';
import 'package:bu_ride/shared/app_extensions.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  AdminModel? admin;

  void getData(WidgetRef ref, User data) async {
    admin = await ref.watch(authRepositoryProvider).getUserData(data.uid).first;
    ref
        .read(userDataControllerProvider.notifier)
        .setUserData(currentPayload: admin!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<User?> authStateChange = ref.watch(authStateChangeProvider);
    return authStateChange.when(
      data: (User? user) {
        return MaterialApp.router(
          title: 'BU Ride',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
            useMaterial3: true,
          ),
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (context) {
              if (user != null) {
                getData(ref, user);
                if (admin != null) {
                  return loggedInRoute;
                }
              }
              return loggedOutRoute;
            },
          ),
          routeInformationParser: const RoutemasterParser(),
        );
      },
      error: (error, stactrace) => MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'bu_logo'.png,
                  height: 100,
                ),
                const SizedBox(height: 10),
                const Text('An error occurred'),
              ],
            ),
          ),
        ),
      ),
      loading: () => const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: primaryBlue,
            ),
          ),
        ),
      ),
    );
  }
}
