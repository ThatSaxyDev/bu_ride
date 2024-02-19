import 'package:bu_ride/shared/utils/loader.dart';
import 'package:bu_ride/theme/palette.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Loadinggg(
          color: primaryBlue,
          height: 35,
        ),
      ),
    );
  }
}
