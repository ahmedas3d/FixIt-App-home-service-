import 'package:dio/dio.dart';
import 'package:fixit_app/core/services/shared_preferenes/onboarding_service.dart';
import 'package:fixit_app/core/services/supabase_setup.dart';
import 'package:fixit_app/features/home/data/repositories/service_provider_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ServiceProviderRepository(Dio()),
        ),
      ],
      child: FixitApp(
        showOnboarding: !isOnboardingCompleted,
        isLoggedIn: isLoggedIn,
      ),
    ),
  );
}
