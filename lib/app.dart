import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'features/onboarding&splash/presentation/screens/onboarding_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FixitApp extends StatefulWidget {
  const FixitApp({super.key});

  @override
  State<FixitApp> createState() => _FixitAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _FixitAppState? state = context.findAncestorStateOfType<_FixitAppState>();
    state?.setLocale(newLocale);
  }
}

class _FixitAppState extends State<FixitApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: _locale,
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(fontFamily: 'Almarai'),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
