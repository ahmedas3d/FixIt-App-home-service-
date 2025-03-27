import 'package:fixit_app/core/utils/service/shared_preferenes/onboarding_service.dart';
import 'package:fixit_app/core/utils/service/supabase_setup.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  final prefs = await SharedPreferences.getInstance();
  final isOnboardingCompleted = await OnboardingService.isOnboardingCompleted();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    FixitApp(showOnboarding: !isOnboardingCompleted, isLoggedIn: isLoggedIn),
  );
}
