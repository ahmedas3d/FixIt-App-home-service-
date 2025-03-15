import 'package:fixit_app/features/onboarding&splash/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class FixitApp extends StatelessWidget {
  const FixitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Almarai'),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
