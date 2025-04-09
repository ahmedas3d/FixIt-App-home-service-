import 'package:fixit_app/core/services/auth_cubit/auth_cubit.dart';
import 'package:fixit_app/core/services/auth_cubit/auth_state.dart';
import 'package:fixit_app/core/services/language_cubit/language_cubit.dart';
import 'package:fixit_app/core/widgets/BottomNavBar/main_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit_app/features/auth/presentation/screens/SignIn_screen.dart';
import 'package:fixit_app/features/onboarding&splash/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixitApp extends StatelessWidget {
  final bool showOnboarding;
  final bool isLoggedIn;

  const FixitApp({
    super.key,
    required this.showOnboarding,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit(isLoggedIn)),
          BlocProvider(create: (context) => LanguageCubit()),
        ],
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, langState) {
            Locale? locale;
            if (langState is LanguageLoaded) {
              locale = langState.locale;
            } else {
              locale = const Locale('en');
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
                          ? const MainScreen()
                          : (showOnboarding
                              ? const OnboardingScreen()
                              : const SignInScreen()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
