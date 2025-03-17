import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fixit_app/features/auth/presentation/screens/SignIn_screen.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/widgets/custom_button.dart';
import 'custom_password_from_field.dart';
import 'custom_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _supabaseAuth = Supabase.instance.client.auth;
  final GlobalKey<FormState> formSignUpKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Form(
      key: formSignUpKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            controller: nameController,
            label: S.of(context).fullName,
            hint: S.of(context).enterYourFullName,
            icon: Icons.person_outline,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 15),
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
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: Color(0xff0054A5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Text(
                S.of(context).iAgreeWithFixItsTermAndConditions,
                style: TextStyle(color: Color(0xff000000), fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 15),
          customButton(
            color: Color(0xff0054A5),
            textColor: Colors.white,
            title: S.of(context).signUp,
            onTap: () async {
              if (formSignUpKey.currentState?.validate() ?? false) {
                // Sign up the user
                final res = await _supabaseAuth.signUp(
                  email: emailController.text,
                  password: passwordController.text,
                );
                if (res.user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: S.of(context).verificationEmailSent,
                        message: S
                            .of(context)
                            .verifydescription(emailController.text),
                        contentType: ContentType.help,
                      ),
                    ),
                  );
                }
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            const SignInScreen(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                  (route) => false,
                );
              }
            },
            size: 55,
            textSize: 18,
          ),
        ],
      ),
    );
  }
}
