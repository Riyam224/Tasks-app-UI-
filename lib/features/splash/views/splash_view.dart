import 'package:flutter/material.dart';
import 'package:notes/features/splash/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor, // ✅ auto chang
      body: SplashViewBody(),
    );
  }
}
