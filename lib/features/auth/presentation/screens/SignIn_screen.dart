import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fixit_app/core/services/auth_cubit/auth_cubit.dart';
import 'package:fixit_app/core/widgets/BottomNavBar/main_bottom_bar.dart';
import 'package:fixit_app/core/widgets/translate_button.dart';
import 'package:fixit_app/features/auth/data/repositories/auth_service.dart';
import 'package:fixit_app/features/auth/presentation/screens/SignUp_screen.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/SignIn_form.dart';
import '../widgets/social_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('assets/images/logo.png', height: 40),
        actions: [const TranslateButton()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                S.of(context).enterYourEmailAndPasswordToLogin,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(height: 20),
              // Sign in form
              SignInForm(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).newToFixIt,
                    style: const TextStyle(fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const SignUpScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      S.of(context).signUpNow,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff0054A5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    S.of(context).or,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SocialButton(
                title: S.of(context).google,
                iconColor: Colors.blue,
                color: Colors.transparent,
                icon: FontAwesomeIcons.google,
                borderColor: Colors.grey,
                onTap: () async {
                  try {
                    final res = await AuthService.googleSignIn();
                    if (res.user != null) {
                      // تحديث حالة المصادقة إلى "مستخدم مسجّل دخول"
                      context.read<AuthCubit>().login();

                      // التنقل إلى الصفحة الرئيسية بعد تسجيل الدخول
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const MainScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                        (route) => false,
                      );

                      // عرض رسالة نجاح
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: S.of(context).welcomeBack,
                            message: S.of(context).welcomeMessage,
                            contentType: ContentType.success,
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    // عرض رسالة خطأ في حال فشل تسجيل الدخول
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: S.of(context).error,
                          message: e.toString(),
                          contentType: ContentType.failure,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
