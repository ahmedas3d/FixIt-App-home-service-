import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fixit_app/features/home/presentation/screens/home_page.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/widgets/custom_button.dart';
import 'custom_password_from_field.dart';
import 'custom_text_form_field.dart';

class SignInForm extends StatefulWidget {
  SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _supabaseAuth = Supabase.instance.client.auth;
  final GlobalKey<FormState> formSignInKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formSignInKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            controller: emailController,
            label: S.of(context).email,
            hint: S.of(context).enterYourEmail,
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          CustomPasswordField(
            controller: passwordController,
            label: S.of(context).password,
            hint: S.of(context).enterYourPassword,
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              S.of(context).forgotPassword,
              style: TextStyle(color: Color(0xff0054A5), fontSize: 16),
            ),
          ),
          const SizedBox(height: 15),
          customButton(
            color: Color(0xff0054A5),
            textColor: Colors.white,
            title: S.of(context).signIn,
            onTap: () async {
              if (formSignInKey.currentState?.validate() ?? false) {
                try {
                  final res = await _supabaseAuth.signInWithPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  if (res.user != null) {
                    // نجاح تسجيل الدخول
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

                    // الانتقال إلى الشاشة الرئيسية
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                HomeScreen(),
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
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: S.of(context).error,
                        message: S.of(context).errorDescription,
                        contentType: ContentType.failure,
                      ),
                    ),
                  );
                }
              }
            },
            size: 60,
            textSize: 18,
          ),
        ],
      ),
    );
  }
}
