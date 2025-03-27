import 'package:fixit_app/core/utils/service/auth_cubit/auth_cubit.dart';
import 'package:fixit_app/core/utils/service/auth_cubit/auth_state.dart';
import 'package:fixit_app/core/utils/service/language_cubit/language_cubit.dart';
import 'package:fixit_app/features/home/presentation/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit_app/features/auth/presentation/screens/SignIn_screen.dart';
import 'package:fixit_app/features/onboarding&splash/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fixit_app/generated/l10n.dart';

class FixitApp extends StatelessWidget {
  final bool showOnboarding;

  const FixitApp({super.key, required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, langState) {
          Locale? locale;
          if (langState is LanguageLoaded) {
            locale = langState.locale;
          }

          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              if (authState is AuthInitial) {
                return const Center(child: CircularProgressIndicator());
              }

              return MaterialApp(
                locale: locale,
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
                    authState is AuthLoggedIn
                        ? const HomeScreen()
                        : (showOnboarding
                            ? const OnboardingScreen()
                            : const SignInScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
