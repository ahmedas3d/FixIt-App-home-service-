import 'package:fixit_app/features/auth/presentation/screens/SignIn_screen.dart';
import 'package:fixit_app/features/onboarding&splash/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fixit_app/generated/l10n.dart';

class FixitApp extends StatefulWidget {
  final bool showOnboarding;

  const FixitApp({super.key, required this.showOnboarding});

  @override
  State<FixitApp> createState() => _FixitAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _FixitAppState? state = context.findAncestorStateOfType<_FixitAppState>();
    state?.setLocale(newLocale);
  }
}

class _FixitAppState extends State<FixitApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(fontFamily: 'Almarai'),
      debugShowCheckedModeBanner: false,
      home:
          widget.showOnboarding
              ? const OnboardingScreen()
              : const SignInScreen(),
    );
  }
}
