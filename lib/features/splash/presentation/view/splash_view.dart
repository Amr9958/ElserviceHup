import 'package:flutter/material.dart';
import 'widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
static const String splashRoute = 'splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashViewBody()),
    );
  }
}